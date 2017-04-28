initialize
streams: aCollectionOfStreams

	streams := aCollectionOfStreams readStream.
	size := aCollectionOfStreams
		inject: 0
		into: [ : sum : eachStream | sum + eachStream size ]