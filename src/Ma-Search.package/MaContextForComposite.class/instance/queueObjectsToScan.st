overriding
queueObjectsToScan
	"Subclasses, override this method and call #queue: to queue the objects you want scanned.  Also, be sure to check #shouldStopScanning very frequently to determine whether to abort your queuing."
	self queueWithChildren: root