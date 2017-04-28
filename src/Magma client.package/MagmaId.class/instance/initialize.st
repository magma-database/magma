initialize-release
initialize
	super initialize.
	uuid := UUID new.
	name := uuid asString36.
	node := MagmaNode new