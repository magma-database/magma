private-report generation
printPrimitiveAttributesOn: aWriteStream 
	self 
		printHeading: 'Primitive Repository Values'
		on: aWriteStream.
	self
		printSignatureOn: aWriteStream ;
		printVersionOn: aWriteStream.
	#(#classDefinitionsOid #definitionOid #anchorOid ) do: 
		[ : each | 
		self 
			printSpecialOid: each
			on: aWriteStream ]