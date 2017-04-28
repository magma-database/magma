*magma-client
isDifferent: anObject using: aMaObjectSerializer
	"To determine different for variable classes requires special-case, therefore dispatch."
	^ anObject
		maIsChangedFrom: self
		using: aMaObjectSerializer