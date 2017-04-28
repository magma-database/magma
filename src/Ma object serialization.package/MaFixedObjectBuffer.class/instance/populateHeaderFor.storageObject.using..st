building
populateHeaderFor: anObject storageObject: storageObject using: aMaObjectSerializer

	| classVersion |
	super
		populateHeaderFor: anObject
		storageObject: storageObject
		using: aMaObjectSerializer.
	classVersion := 
		aMaObjectSerializer classIdManager
			currentVersionOfClass: (aMaObjectSerializer classFor: anObject).
	self classVersion: classVersion