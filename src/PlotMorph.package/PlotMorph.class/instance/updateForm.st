drawing
updateForm
	"Override superclass implementation to do drawing of data."
	| canvas lineNumber |
	super updateForm.
	stack
		ifNil: [ self drawTheGrid ]
		ifNotNil:
			[ stack plots do:
				[ : each | each drawTheGrid ] ].
	self scalePoints.
	canvas := form getCanvas.
	lineNumber := 0.
	series do:
		[ : each | each
			drawOn: canvas
			for: self.
		(each
			hasXbetween: self limitMinX
			and: self limitMaxX)
			ifTrue:
				[ lineNumber := lineNumber + 1.
				lineNumber < 6 ifTrue:
					[ self
						drawLabelFor: each
						lineNumber: lineNumber
						on: canvas ] ]
			ifFalse:
				[ lineNumber = 6 ifTrue:
					[ self
						drawLabel: 'etc.'
						color: self color negated
						lineNumber: lineNumber
						on: canvas ] ] ]