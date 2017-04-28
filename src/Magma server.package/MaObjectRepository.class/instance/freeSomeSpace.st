actions
freeSomeSpace
	"Called by LowSpaceWatcher.  See #lowSpaceWatcher."
	transactionLog removeOldestEntries.
	self isOpen ifFalse: [ self unregisterAsMemoryHog ]