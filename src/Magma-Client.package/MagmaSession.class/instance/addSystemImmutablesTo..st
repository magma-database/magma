private
addSystemImmutablesTo: aMaImmutabilityStrategy 
	aMaImmutabilityStrategy
		
		treatAny: MaClassDefinition
		asImmutableIf: [ : aMaClassDefinition | true ] ;
		
		treatObjectReferencedBy: 'instVarNames'
		onAny: MaClassDefinition
		asImmutableIf: [ : aMaClassDefinition | true ]