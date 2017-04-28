private
writeHeadingsFor: aClass to: aWriteStream 
	| rowSpec |
	rowSpec := self rowSpecificationFor: aClass.
	rowSpec hasHeadings ifFalse: [ ^ self ].
	aWriteStream cr.
	self indentInto: aWriteStream.
	rowSpec writeHeadingsTo: aWriteStream.
	rowSpec hasUnderlinedHeadings ifTrue: 
		[ aWriteStream cr.
		self indentInto: aWriteStream.
		rowSpec writeHeadingUnderlinesTo: aWriteStream ].
	aWriteStream cr