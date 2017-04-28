initialize-release
initialize
	super initialize.
	flushTimeHistory := MaStatHistory name: 'Flush-to-Disk Times'