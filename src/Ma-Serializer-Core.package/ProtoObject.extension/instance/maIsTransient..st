*ma-serializer-core
maIsTransient: varIndex 
	"Answers whether my object referenced at varIndex should be serialized."
	| transients |
	varIndex = 0 "root object" ifTrue: [ ^ false ].
	varIndex > self class instSize ifTrue: [ ^ false ].
	transients := self maTransientVariables.
	transients ifEmpty: [ ^ false ].
	^ transients includes: (self class maAllInstVarNamesAt: varIndex)