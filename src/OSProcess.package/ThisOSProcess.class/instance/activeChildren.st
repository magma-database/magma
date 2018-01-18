child process management
activeChildren
	"Answer child processes which are currently believed to be running."

	"OSProcess thisOSProcess activeChildren"

	^ accessProtect critical: [ childProcessList select: [ :p | p isComplete not ] ].
