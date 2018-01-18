*ma-core
maPrintSelector: aSymbol on: aStream 
	| value |
	aStream
		 cr ;
		 tab ;
		 nextPutAll: aSymbol ;
		 nextPutAll: ' : '.
	value := [ self perform: aSymbol ]
		on: Error
		do: [ : exc | exc return: (exc messageText ifNil: [ 'error' ]) ].
	aStream maPrint: value