access
at: keyObject put: valueObject 
	"Add valueObject at keyObject.  If there is already an object at an equivalent to keyObject, replace it with each of keyObject and valueObject."
	| hash assoc |
	assoc := table
		at: (hash := self hashFor: keyObject)
		ifAbsentAdd:
			[ MagmaDictionaryAssociation
				key: keyObject
				value: valueObject ].
	"assoc was either found or just created.  If it was found, it might be for a different keyObject (but with the same hash).  Do the right thing."
	^ (assoc key = keyObject
		ifTrue:
			[ assoc
				 key: keyObject ;
				 value: valueObject ;
				 yourself ]
		ifFalse:
			[ table
				add:
					(MagmaDictionaryAssociation
						key: keyObject
						value: valueObject)
				at: hash ]) value