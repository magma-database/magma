private
shouldTraverseNoGlobals: anObject 
	anObject == Smalltalk ifTrue: [ ^ false ].
	anObject == Processor ifTrue: [ ^ false ].
	anObject == Display ifTrue: [ ^ false ].
	anObject == ActiveHand ifTrue: [ ^ false ].
	anObject == ActiveWorld ifTrue: [ ^ false ].
	anObject == Sensor ifTrue: [ ^ false ].
	anObject == SourceFiles ifTrue: [ ^ false ].
	anObject == SystemOrganization ifTrue: [ ^ false ].
	anObject == TextConstants ifTrue: [ ^ false ].
	anObject == World ifTrue: [ ^ false ].
	anObject isBehavior ifTrue: [ ^ false ].
	anObject maIsEnvironment ifTrue: [ ^ false ].
	^ true