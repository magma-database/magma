initialize-release
initialize
	super initialize.
	tally := MagmaCounter new.
	collisions := 0