creation
establishReferencesFrom: anObject using: aMaObjectSerializer 
	"Set and Dictionary require special-case processing, therefore we dispatch."
	anObject
		maEstablishPointerReferencesFor: self
		using: aMaObjectSerializer