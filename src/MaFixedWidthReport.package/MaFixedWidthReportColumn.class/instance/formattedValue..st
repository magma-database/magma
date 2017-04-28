private
formattedValue: aString 
	| cell startPosition |
	cell := (String new: self width + self leftMarginSize) atAllPut: Character space.
	(repeat = false and: [ previousValue = aString ]) ifTrue: [ ^ cell ].
	previousValue := aString.
	aString size >= self width ifTrue: 
		[ | truncatedValue |
		truncatedValue := aString 
			copyFrom: 1
			to: self width.
		self useEllipsisOnTruncate ifTrue: 
			[ truncatedValue 
				replaceFrom: self width - 2
				to: self width
				with: '...'
				startingAt: 1 ].
		^ cell 
			replaceFrom: self leftMarginSize + 1
			to: cell size
			with: truncatedValue
			startingAt: 1 ].
	startPosition := (self startingPositionFor: aString) + self leftMarginSize.
	^ cell 
		replaceFrom: startPosition
		to: startPosition + aString size - 1
		with: aString
		startingAt: 1