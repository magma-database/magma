accessing
write: aCollection to: aStream 
	| prevClass |
	aCollection do: 
		[ : each | 
		each maOriginalClass = prevClass ifFalse: 
			[ self 
				writeHeadingsFor: each
				to: aStream.
			prevClass := each maOriginalClass ].
		self 
			writeBasicAttributesOf: each
			to: aStream.
		self 
			writeSubReportsOf: each
			to: aStream ]