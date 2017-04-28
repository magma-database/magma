evaluating
evaluationCount: anObject 
	"Answer how many hashes cause anObject to qualify for the reiver expression."
	^ self isConjunction 
		ifTrue: 
			[ self terms 
				inject: self terms size
				into: [ : min : eachTerm | min min: (eachTerm evaluationCount: anObject) ] ]
		ifFalse: 
			[ self terms 
				inject: 0
				into: [ : sum : eachTerm | sum + (eachTerm evaluationCount: anObject) ] ]