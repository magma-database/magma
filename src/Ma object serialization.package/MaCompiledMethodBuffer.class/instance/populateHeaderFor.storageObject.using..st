building
populateHeaderFor: aMethodContextOrCompiledMethod storageObject: storageObject using: aMaObjectSerializer 
	super
		populateHeaderFor: aMethodContextOrCompiledMethod
		storageObject: storageObject
		using: aMaObjectSerializer.
	self captureEssentialAttributesFrom: aMethodContextOrCompiledMethod