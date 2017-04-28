accessing
at: anObject ifPresent: oneArgBlock ifAbsent: zeroArgBlock 
	| current uniqueObject |
	uniqueObject := String empty.
	^ (current := self
		at: anObject
		ifAbsent: [ uniqueObject ]) == uniqueObject
		ifTrue: [ zeroArgBlock value ]
		ifFalse: [ oneArgBlock value: current ]