child process management
discardExitedChildren
	"Remove entries for completed child processed from dictionary."

	self updateAllMyChildren.
	childProcessList
		select: [ :p | p isComplete ]
		thenDo: [ :e | self unregisterChildProcess: e ].
	^ childProcessList
