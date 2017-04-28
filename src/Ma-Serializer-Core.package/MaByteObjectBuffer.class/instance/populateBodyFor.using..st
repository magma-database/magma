actions
populateBodyFor: storageObject using: aMaObjectSerializer 
	storageObject
		maStreamBytesInto: self
		for: aMaObjectSerializer