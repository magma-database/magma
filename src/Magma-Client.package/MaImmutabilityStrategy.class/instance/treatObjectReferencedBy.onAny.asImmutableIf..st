setup
treatObjectReferencedBy: variableName onAny: aClass asImmutableIf: oneArgBlock 
	"Specify immutability of an object by its referencing object."
	| spec |
	(aClass allInstVarNames includes: variableName) ifFalse: [ MagmaUserError signal: aClass name , ' does not have a variable named ' , variableName ].
	aClass withAllSubclassesDo:
		[ : eachClass | spec := specs
			at: eachClass
			ifAbsentPut: [ Dictionary new ].
		spec
			at: variableName
			put: oneArgBlock ]