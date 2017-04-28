initialize-release
release
	"This should be called when no longer wishing to capture history so the timer processes will be cleaned up."
	self guard critical: 
		[ "#release should never blow up, even when it is malformed, therefore the nil check."
		timer ifNotNil: [ timer cancel ].
		self isActive ifTrue: [ self archiveActive ] ]