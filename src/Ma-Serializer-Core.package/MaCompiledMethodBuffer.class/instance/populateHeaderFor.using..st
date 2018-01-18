building
populateHeaderFor: aMethodContextOrCompiledMethod using: aMaObjectSerializer 
	super
		populateHeaderFor: aMethodContextOrCompiledMethod
		using: aMaObjectSerializer.
	self captureEssentialAttributesFrom: aMethodContextOrCompiledMethod