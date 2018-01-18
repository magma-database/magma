copying
attributesToDeepCopy
	"Subclasses override."
	^ (attributes
		ifNil: [ Array empty ]
		ifNotNil: [ attributes keys ]) copyWithoutAll: self attributesNotToDeepCopy