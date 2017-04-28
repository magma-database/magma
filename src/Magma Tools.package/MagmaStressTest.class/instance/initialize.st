initialize-release
initialize
	super initialize.
	config := MagmaStressTestConfiguration new.
	uuid := UUID new.
	counter := 0