initialize - release
newPid
	"This image is now being run in a new VM process with different pid. Pause the handling
	of child processes, and remove references to child processes that no longer pertain to
	the current VM process."

	grimReaper ifNotNilDo: [ :p | p terminate. grimReaper := nil ].
	self changed: #pid.
	self restartChildWatcherProcess