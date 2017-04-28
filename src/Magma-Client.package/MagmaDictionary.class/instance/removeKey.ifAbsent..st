access
removeKey: keyObject ifAbsent: aBlock 
	"Remove key (and its associated value) from the receiver. If key is not in the receiver, answer the result of evaluating aBlock. Otherwise, answer the value externally named by key."
	^ (table
		remove:
			(MagmaDictionaryAssociation
				key: keyObject
				value: nil)
		at: (self hashFor: keyObject)
		ifAbsent: [ ^ aBlock value ]) value