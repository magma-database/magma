child process management
childPids

	^ childProcessList collect: [ :p | p pid ]
