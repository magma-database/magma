accessing
objectEqualTo: anObject 
	"Answer the object equal to anObject, or nil if none."
	^ self hasAdditions ifTrue:
		[ (self added
			associationAt: anObject
			ifAbsent: [ nil ]) ifNotNilDo:
			[ : assoc | assoc key ] ]