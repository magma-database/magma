*magma-client
immutabilityStrategy
	^ MaImmutabilityStrategy new
		treatAny: String
		asImmutableIf: [ : string | true ] ; 
		yourself