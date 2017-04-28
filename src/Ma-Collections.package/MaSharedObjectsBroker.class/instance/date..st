access
date: aDate 
	"Answer the exact shared date instance for aDate."
	^ aDate ifNotNil:
		[ aDate maOriginalClass = Date ifFalse: [ MaSoftwareError signal: 'The ''dates'' collection is intended to hold only instances of Date.' ].
		aDate start offset isZero ifFalse: [ MaWarning signal: 'Are you sure you want to canonicalize a non-globalalized Date?' ].
		(dates includesKey: aDate realObjectIfMutatingProxy)
			ifTrue: [ dates at: aDate realObjectIfMutatingProxy ]
			ifFalse:
				[ | dateToPut |
				"Put only a copy to ensure it is a unique instance to this broker and not belonging in another db."
				dateToPut := aDate veryDeepCopy.
				dates
					at: dateToPut
					ifAbsentPut: [ dateToPut ] ] ]