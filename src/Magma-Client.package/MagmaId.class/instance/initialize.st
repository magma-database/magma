initialize-release
initialize
	super initialize.
	uuid := UUID new.
	name := uuid asString.
	node := MagmaNode new