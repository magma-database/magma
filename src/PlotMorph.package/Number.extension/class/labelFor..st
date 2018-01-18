*plotmorph
labelFor: proposedString
	"Since we are putting labels by powers of 10, we often end up with a lot of trailing '.00's if the formatter wants to see cents.  These just take up space so don't show them."
	| lastZeroPos |
	lastZeroPos := nil.
	proposedString size
		to: 1
		by: -1
		do:
			[ : pos | | digit |
			digit := proposedString at: pos.
			digit = $0
				ifTrue: [ lastZeroPos := pos ]
				ifFalse:
					[ | lastDot |
					lastDot := proposedString lastIndexOf: $..
					^ (lastZeroPos notNil and: [ lastDot > 0 ])
						ifTrue:
							[ proposedString
								copyFrom: 1
								to:
									(lastZeroPos - 1 = lastDot
										ifTrue: [ lastDot - 1 ]
										ifFalse: [ lastZeroPos - 1 ]) ]
						ifFalse: [ proposedString ] ] ].
	^ proposedString