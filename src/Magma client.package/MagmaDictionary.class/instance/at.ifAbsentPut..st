access
at: keyObject ifAbsentPut: aBlock 
	"Answer the object at keyObject, if it isn't found, add the value of aBlock at keyObject and answer it.  IMPORTANT:  Do not nest calls to this method."
	| hash assoc |
	assoc := table
		at: (hash := self hashFor: keyObject)
		ifAbsentAdd:
			[ MagmaDictionaryAssociation
				key: keyObject
				value: aBlock value ].
	"assoc was either found or just created.  If it was found, it might be for a different keyObject (but with the same hash).  Do the right thing."
	^ (assoc key = keyObject
		ifTrue: [ assoc ]
		ifFalse:
			[ table
				add:
					(MagmaDictionaryAssociation
						key: keyObject
						value: aBlock value )
				at: hash ]) value