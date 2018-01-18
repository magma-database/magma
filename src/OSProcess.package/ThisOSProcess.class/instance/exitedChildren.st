child process management
exitedChildren
	"Answer child processes which have exited and are no longer running."

	"OSProcess thisOSProcess exitedChildren"

	^ accessProtect critical: [ childProcessList select: [ :p | p isComplete ]].
