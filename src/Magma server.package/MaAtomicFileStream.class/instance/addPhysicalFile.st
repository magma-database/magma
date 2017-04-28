private
addPhysicalFile
	sizes add: 0.
	^ (StandardFileStream newFileNamed: self nextName) in: 
		[ : stream | 
		stream closed ifTrue: [ MagmaEnvironmentError signal: 'file did not open' ].
		fileStreams add: stream ]