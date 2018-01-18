accessing
recordAtLevel: levelInteger

	^levelInteger > recordPath size
		ifTrue:
			[ recordPath first independentCopy ]
		ifFalse:
			[ recordPath at: levelInteger ]
