access
literal: anObject 
	"Answer the shared version of anObject, a literal String or Array."
	anObject == nil ifTrue: [ ^ anObject ].
	anObject == true ifTrue: [ ^ anObject ].
	anObject == false ifTrue: [ ^ anObject ].
	anObject isSymbol ifTrue: [ ^ anObject ].
	(anObject isInteger and: [ anObject <= 1073741823 ]) ifTrue: [ ^ anObject ].
	(self shouldCacheAsLiteral: anObject) ifFalse: [ ^ anObject ].
	^ self literals
		at: anObject
		ifAbsentPut:
			[ anObject yourself isArray
				ifTrue:
					[ anObject veryDeepCopy collect:
						[ : each | self literal: each ] ]
				ifFalse:
					[ anObject isVariableBinding
						ifTrue:
							[ anObject veryDeepCopy
								key: (self literal: anObject key)
								value: (self literal: anObject value) ]
						ifFalse:
							[ | master masterInArray |
							master := anObject veryDeepCopy.
							masterInArray := Array with: master.
							self literals
								at: masterInArray
								ifAbsentPut: [ masterInArray ].
							master as32BitFloatIfFloat ] ] ]