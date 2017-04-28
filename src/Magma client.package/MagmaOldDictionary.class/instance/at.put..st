add / remove
at: key put: anObject 
	"Set the value at key to be anObject.  If key is not found, create a new entry for key and set is value to anObject. Answer anObject."
	(self scanFor: key)
		ifNil:
			[ self add:
				(MagmaDictionaryAssociation
					key: key
					value: anObject) ]
		ifNotNilDo: [ : assoc | assoc value: anObject ].
	^ anObject