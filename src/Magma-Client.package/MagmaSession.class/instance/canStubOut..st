private
canStubOut: anObject 
	anObject maIsMutatingProxy ifTrue: [ ^ anObject maRealObjectIsReified ].
	(self isPersistent: anObject) ifFalse: [ ^ false ].
	anObject maOriginalClass = MaClassDefinition ifTrue: [ ^ false ].
	anObject == serializer classDefinitionsById ifTrue: [ ^ false ].
	^ serializer classDefinitionsById noneSatisfy:
		[ : eachCollection | eachCollection == anObject ]