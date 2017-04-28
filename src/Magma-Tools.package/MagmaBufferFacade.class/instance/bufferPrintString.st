printing
bufferPrintString
	^ String streamContents:
		[ : stream | stream
			 maPrint: 'a ' ;
			 maPrint: self objectClassName.
		buffer isBytes ifTrue: [ stream maPrint: ' -- '. self objectClassName caseOf: {
				[ #String ] -> 
					[ stream
						 maPrint: $' ;
						 maPrint: buffer maAbbreviatedString ;
						 maPrint: $' ]} ].
				[ #ByteArray -> [ stream maPrint: self asByteArray maAbbreviatedString ]] ]