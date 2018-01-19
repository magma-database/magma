add / remove
removeKey: key ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in 
	the receiver, answer the result of evaluating aBlock. Otherwise, answer 
	the value externally named by key."

	^ (self scanFor: key)
		ifNil: [ aBlock value ]
		ifNotNil: [ :assoc | self remove: assoc ]
