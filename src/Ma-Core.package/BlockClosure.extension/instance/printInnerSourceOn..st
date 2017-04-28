*ma-core
printInnerSourceOn: aStream 
	self decompile
		ifNil: [ aStream nextPutall: '--source missing--' ]
		ifNotNil:
			[ : parseNode | parseNode statements anyOne
				printOn: aStream
				indent: 0 ]