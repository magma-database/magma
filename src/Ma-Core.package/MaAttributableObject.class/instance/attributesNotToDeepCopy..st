copying
attributesNotToDeepCopy: anArray
	^ (self attributeNamed: #attributesNotToDeepCopy) ifNil: [ Array empty ]