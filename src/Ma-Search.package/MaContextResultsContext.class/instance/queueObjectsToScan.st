overriding
queueObjectsToScan
	"This is sloppy -- but allows us to query AS the source is still searching."
	source do: [ : each | self queue: each ].
	scanProcess taskSize: queue size.
	[ source source isRunning ] whileTrue:
		[ (Delay forSeconds: 1) wait.
		[ source queue peek notNil ] whileTrue:
			[ scanProcess taskSize: scanProcess taskSize + 1.
			self queue: source queue next ] ]