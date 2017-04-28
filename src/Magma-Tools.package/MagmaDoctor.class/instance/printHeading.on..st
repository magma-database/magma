private-report generation
printHeading: aString on: aWriteStream 
	aWriteStream
		cr ;
		cr ;
		withAttributes: self headerAttributes
			do: [ aWriteStream maPrint: aString ]