private-report generation
printLabel: aString value: anObject withAttributes: attributes on: aWriteStream 
	aWriteStream 
		withAttributes: attributes
		do: 
			[ aWriteStream
				cr ;
				tab ;
				maPrint: aString ;
				maPrint: ':  ' ].
	aWriteStream 
		withAttributes: self dataAttributes
		do: [ aWriteStream maPrint: anObject ]