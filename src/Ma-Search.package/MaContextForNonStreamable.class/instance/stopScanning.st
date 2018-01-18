private
stopScanning
	super stopScanning.
	"If you have correctly implemented your queueObjectsToScan method, then your queuingProcess will abort from the above."
	queueingProcess ifNotNil:
		[ [ queueingProcess isTerminated ] whileFalse: [ (Delay forMilliseconds: 100) wait ] ]