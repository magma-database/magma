*magma client
isDifferent: anObject using: aMaObjectSerializer
	"To determine different for variable classes requires special-case, therefore dispatch."
	anObject maInstSize ~= self objectInstSize ifTrue: [ ^ true ].
	self instVarsDoWithIndex: 
		[ : eachWord : index |
		eachWord ~= (anObject instVarAt: index) ifTrue: [ ^ true ] ].
	^ false