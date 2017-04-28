private
enumerateCheckAndDo
	"findBlock must send #check: to the receiver with the objects needing checked."
	count := 0.
	self ensureOpen.
	startBlock cull: session cull: self.
	lastCommit := Time millisecondClockValue.
	enumerateBlock cull: session cull: self