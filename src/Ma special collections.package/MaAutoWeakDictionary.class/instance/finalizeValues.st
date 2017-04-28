finalization
finalizeValues
	
	| asc |
	
	asc := list swapWithNil.
	[ asc notNil ] whileTrue: [ | next |
		next := asc finNext.
		asc clear.
		tally := tally - 1.
		asc := next.
	].

