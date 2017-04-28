private
commitLogFileStreamsFrom: startCommitNumber do: aBlock unless: dontDoItBlock 
	"Value aBlock with each appropriate StandardFileStream instance for reading a chunk of records from startCommitNumber."
	self 
		commitLogFileNamesFrom: startCommitNumber
		do: 
			[ : eachFilename | 
			dontDoItBlock value ifFalse: 
				[ (FileStream readOnlyFileNamed: eachFilename) in: [ : stream | [ aBlock value: stream ] ensure: [ stream close ] ] ] ].
	dontDoItBlock value ifFalse: 
		[ self hasActiveCommitLog ifTrue: 
			[ self commitLogFile reset.
			aBlock value: self commitLogFile ] ]