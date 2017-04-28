copying
attributesNotToDeepCopy
	^ (self attributeNamed: #attributesNotToDeepCopy) ifNil: [ Array empty ]