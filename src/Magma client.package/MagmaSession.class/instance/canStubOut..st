private
canStubOut: anObject 
	anObject maIsMutatingProxy ifTrue: [ ^ anObject maRealObjectIsReified ].
	(self isPersistent: anObject) ifFalse: [ ^ false ].
	anObject maOriginalClass = MaClassDefinition ifTrue: [ ^ false ].
	anObject == serializer classIdManager classDefinitionsById ifTrue: [ ^ false ].
	^ serializer classIdManager classDefinitionsById noneSatisfy:
		[ : eachCollection | eachCollection == anObject ]