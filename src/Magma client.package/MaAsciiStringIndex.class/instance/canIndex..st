accessing
canIndex: anObject

	^(super canIndex: anObject) and: [ (self indexObjectFor: anObject) isString ]
