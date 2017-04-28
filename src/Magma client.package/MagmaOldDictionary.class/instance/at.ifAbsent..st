accessing
at: key ifAbsent: aBlock 
	"Answer the value associated with the key or, if key isn't found,
	answer the result of evaluating aBlock."

	^ (self scanFor: key)
			ifNil: [ aBlock value ] ifNotNilDo: [ :assoc | assoc value ]