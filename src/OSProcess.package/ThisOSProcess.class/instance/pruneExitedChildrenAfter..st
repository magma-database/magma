child process management
pruneExitedChildrenAfter: size
	"Limit the size of the child process registry. Select the last entries, and unregister
	them if they are no longer active."

	"OSProcess thisOSProcess pruneExitedChildrenAfter: 5"

	(accessProtect critical: [childProcessList allButFirst: size])
		do: [ :e |
			e isComplete ifTrue: [ self unregisterChildProcess: e ]]
