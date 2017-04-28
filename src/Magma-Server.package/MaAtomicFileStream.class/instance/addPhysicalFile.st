private
addPhysicalFile
	sizes add: 0.
	^ (StandardFileStream newFileNamed: self nextName) in: 
		[ : stream | 
		(stream isNil or: [stream closed]) ifTrue: [ MagmaEnvironmentError signal: 'file did not open' ].
		stream binary.
		fileStreams add: stream ]