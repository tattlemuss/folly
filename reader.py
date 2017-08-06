sndh_start = 0x0703FE
tune_data_start = 0x071392

fh = open('LEDSTORM.SND', 'rb')
fh.read(tune_data_start - sndh_start)	# skip header
d = fh.read(99999)
fh.close()

def note_name(value):
    note_names = ['C ', 'C#', 'D ', 'D#', 'E ', 'F ', 'F#',
                  'G ', 'G#', 'A ', 'A#', 'B ']
    if value < 0:
        return '-'
    return "%s-%d" % (note_names[value % 12], int(value/12))

registers = [
		"per_lo_a",	# 0
		"per_hi_a",	# 1
		"per_lo_b",	# 2
		"per_hi_b",	# 3
		"per_lo_c",	# 4
		"per_hi_c",	# 5
		"noise_freq",	# 6
		"mixer",	# 7
		"vol_a",	# 8
		"vol_b",	# 9
		"vol_c",	# 10
		"env_per_hi",	# 11
		"env_per_lo",	# 12
		"env_shape"	# 13
]

sizes = [
	[1, "start_loop"],		# 0
	[0, "end_loop"],		# 1
	[1, "default_note_time"],	# 2	whether notes have times
	[0, "stop"],			# 3
	[2, "gosub" ],			# 4
	[0, "return" ],			# 5
	[1, "set_transpose"],		# 6
	[1, "set_raw_detune"],		# 7
	[2, "direct_write"],		# 8
	[3, "set_adsr"],		# 9	start/end volumes, attack/decay spd, env start step
	[1, "set_adsr_reset"],		# a	whether a new note value resets env
	[3, "set_arpeggio"],		# b	note delta, up speed, down speed
	[1, "set_slide"],		# c	slide delta
	[4, "set_vibrato"],		# d
	[0, "skip_transpose"],		# e	don't apply transpose on next note
	[0, "set_fixfreq"],		# f	first byte == 0, update mixer + stop, else read 4 bytes in total
	[2, "jump" ],			# 10
	[1, "set_mute_time"],		# 11
	[1, "set_nomute"],		# 12
]

# Data access	
def get(i):
	return ord(d[i])
def get_word(i):
	return get(i) + 256 * get(i + 1)

def parse_track(fh, song_start):
	def output(txt):
		fh.write("time:%04d %s%s\n" % (time, "\t" * len(stack), txt))
		
	fh.write("---- Track start ----\n")
	stack = []
	i = song_start
	time = 0

	notes = []
	# State
	note_default_time = 0
	current_transpose = 0
	loop_count = 0
	loop_address = 0
	env_volume = 0
	
	def sign_extend(x):
		if x < 128:
			return x
		return 256 - x

	while i < len(d) - 2:
		orig_i = i
		b = get(i)
		i = i + 1
		if (b >= 0x80):		# command
			index = (b & 0x1f)
			if index >= len(sizes):
				print "Fail index", index
				break
			(size, name) = sizes[index]

			# Default sundry items
			args = []
			for l in range(0, size):
				b = get(i)
				i = i + 1
				args.append("$%x" % b)
			all_args = ', '.join(args)
			comment = ''

			if index == 0:
				# Loop
				loop_count = get(orig_i + 1)
				loop_address = i			# the address after reading arguments
				comment = "Loop start (count %d)" % loop_count
			elif index == 1:
				assert loop_address != 0
				assert loop_count != 0
				comment = "Looping test"
				loop_count -= 1
				if loop_count != 0:
					i = loop_address		# jump back to start of loop
			elif index == 2:
				note_default_time = get(orig_i + 1)
			elif index == 3:
				break
			elif index == 4:
				# Gosub
				new_i = get(orig_i + 1) + get(orig_i + 2) * 256
				comment = "Gosub %x" % new_i
				stack.append(i)		# Save old pos after reading args
				i = new_i
			elif index == 5:
				# Return
				i = stack.pop()
				comment = "Return to %x" % i
			elif index == 6:
				current_transpose = sign_extend(get(orig_i + 1))
			elif index == 8:
				ym_reg = registers[get(orig_i + 1)]
				ym_value = get(orig_i + 2)
				comment = "\tWrite $%x to reg '%s'" % (ym_value, ym_reg)
			elif index == 9:
				env_volume = get(orig_i + 1) >> 4
				env_min_volume = get(orig_i + 1) & 15
				env_attack_speed = get(orig_i + 2) >> 4
				env_decay_speed = get(orig_i + 2) & 15
				env_first_step = get(orig_i + 3)
				comment = "\tVolume %d -> %d Attackspd: %d Decayspd: %d start step; %d" % (env_volume, env_min_volume, env_attack_speed, env_decay_speed, env_first_step)

			elif index == 15:
				control = get(orig_i + 1)
				if control != 0:
					# Fetch 3 more bytes
					mixer = get(orig_i + 2)
					period = get_word(orig_i + 3)
					comment = "Fixed freq time: %x / mixer: %x period: %x" % (control, mixer, period)
					i = orig_i + 5
				else:
					comment = "Fixed freq off"
					i = orig_i + 2		# sets -$c
			elif index == 16:
				# Jump
				new_i = get(orig_i + 1) + get(orig_i + 2) * 256
				comment = "Jump to $%x" % new_i
				i = new_i
				break				# Stop at jump, we have to assume this is a loop

			output("$%x {%x} -> %s(%s) %s" % (orig_i, index, name, all_args, comment))
		else:
			note_time = note_default_time
			if note_default_time == 0:
				note_time = get(orig_i + 1)
				i = orig_i + 2			# Extra byte
			final_note = b + current_transpose
			output("$%x Note: %s {0x%x} time:%d" % (orig_i, note_name(final_note), final_note, note_time))

			notes.append( (time, final_note, env_volume) )
			time += note_time


	print "offset: ", i
	return notes

def get_channel_start(channel, tune):
	index = 4 + (20 * channel) + (2 * tune)
	return get_word(index)

for tune in range(0, 7):
	print "%x" % get_channel_start(0, tune)
	print "%x" % get_channel_start(1, tune)
	print "%x" % get_channel_start(2, tune)

	fh = open("tune_%d.txt" % tune, "w")
	notes_a = parse_track(fh, get_channel_start(0, tune))
	notes_b = parse_track(fh, get_channel_start(1, tune))
	notes_c = parse_track(fh, get_channel_start(2, tune))
	fh.close()
	
	# Output tune to PNG
	from PIL import Image, ImageDraw, ImageColor
	row_height = 12 * 8		# Number of notes

	width = 64 * 16
	height = row_height * 9
	i = Image.new("RGB", (width, height), (64, 64, 64))
	draw = ImageDraw.Draw(i)

	def plot_channel(notes, colour):
		col = ImageColor.getcolor(colour, "RGB")
		
		for (time, note, env_volume) in notes:
			note_col = (col[0] * env_volume / 15, col[1] * env_volume / 15, col[2] * env_volume / 15)
			note_x = time % width
			note_y = (time / width) * row_height + row_height - note
			draw.rectangle( (note_x, note_y, note_x + 1, note_y + 1), fill=note_col)
			

	plot_channel(notes_a, "red")
	plot_channel(notes_b, "lime")
	plot_channel(notes_c, "yellow")
	bar = ImageColor.getcolor("#777", "RGB")
	row = ImageColor.getcolor("#efefef", "RGB")

	y = 0
	while y < height:
		draw.line((0, y, width, y), fill=row)
		y += row_height
		
	filename = "tune_%d.png" % tune
	fp = open(filename, "wb")
	i.save(fp, "PNG")
	fp.close()





