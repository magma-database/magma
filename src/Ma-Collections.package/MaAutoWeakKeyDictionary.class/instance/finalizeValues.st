as yet unclassified
finalizeValues
	
	| asc |
	
	self class supportsAutoCleaning ifFalse: [
		"do the hard way, scan whole dictionary"
		array do: [:e |
			asc := e.
			[ asc notNil ] whileTrue: [ | next |
				next := asc next.
				asc key ifNil: [ asc clear. tally := tally - 1 ].
				asc := next ]
		].
		^ self.
	].

	asc := list swapWithNil.
	[ asc notNil ] whileTrue: [ | next |
		next := asc finNext.
		asc clear.
		tally := tally - 1.
		asc := next.
	].

