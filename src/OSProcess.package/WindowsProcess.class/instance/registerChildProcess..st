child process management
registerChildProcess: anOSProcess
	"Register the external process and set an exit handler thread to signal when
	the process exits."

	super registerChildProcess: anOSProcess.
	self threads add: self restartChildWatcherThread.
	^ anOSProcess
