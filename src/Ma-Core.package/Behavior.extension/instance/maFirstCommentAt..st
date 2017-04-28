*ma-core
maFirstCommentAt: selector 
	"A much more-convenient method than firstCommentAt:, which requires you to specify the exact class, a problem when the method is implemented in the superclass methodDict."
	^ (self methodDict includesKey: selector) 
		ifTrue: [ self firstCommentAt: selector ]
		ifFalse: 
			[ self superclass 
				ifNil: [ '' ]
				ifNotNil: [ self superclass maFirstCommentAt: selector ] ]