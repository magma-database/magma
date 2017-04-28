as yet unclassified
doesNotUnderstand: aMessage

	^ aMessage selector last = $:
		ifTrue:
			[ self
				instVarNamed: (aMessage selector copyWithout: $:)
				put: aMessage argument;
				yourself ]
		ifFalse:
			[ self instVarNamed: aMessage selector ]