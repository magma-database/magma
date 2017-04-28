*ma base additions
at: anObject ifPresent: oneArgBlock ifAbsent: zeroArgBlock 
	| current uniqueObj |
	uniqueObj := String empty.
	^ (current := self 
		at: anObject
		ifAbsent: [ uniqueObj ]) == uniqueObj 
		ifTrue: [ zeroArgBlock value ]
		ifFalse: [ oneArgBlock value: current ]