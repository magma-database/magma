private
graphFromLargeCollection: oidInteger do: oneArgBlock using: aMaReadStrategy
	| fileIndex |
	fileIndex := (repositoryController 
		requestCritical: 
			[ repositoryController repository collectionManagerFor: oidInteger ]) memberIndex.
	MagmaNotification signal: 'beginning enumeration of ', fileIndex size printString, ' objects in MagmaCollection ', oidInteger printString.
	fileIndex
		do: oneArgBlock
		for: self
		using: aMaReadStrategy.
	MagmaNotification signal: 'MagmaCollection enumeration complete:  ', oidInteger printString