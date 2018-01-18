testing
hasSameDefinitionAs: aClassOrMaClassDefinition 
	"Answer whether my definition is the same as aClassOrMaClassDefinition.  However, since Ma serializes only above the Smalltalk meta-layer, don't acknowledge differences in Class or Metaclass."
	^ (self name = #Class or: [ self name = #Metaclass ])
		or: [ self allInstVarNames maMatchesElementsOf: aClassOrMaClassDefinition allInstVarNames ]