server
snapshot: shouldSave andQuit: shouldQuit 
	"Delay enough for response to be sent back to conductor."
	[ (Delay forSeconds: 1) wait.
	self orchestra homePlayer stop.
	Smalltalk
		snapshot: shouldSave
		andQuit: shouldQuit ] fork.
	^ nil