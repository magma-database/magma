drawing
drawLabel: aString color: aColor lineNumber: anInteger on: aCanvas 
	| db |
	aString ifNil: [ ^ self ].
	db := self drawBounds.
	aCanvas
		drawString: aString
		at: db left + 5 @ (db top + ((anInteger-1) * (font height + 2)))
		font: font
		color: aColor