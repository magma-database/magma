building
populateHeaderFor: anObject using: aMaObjectSerializer

	| classVersion |
	super
		populateHeaderFor: anObject
		using: aMaObjectSerializer.
	classVersion := 
		aMaObjectSerializer classIdManager
			currentVersionOfClass: (aMaObjectSerializer classFor: anObject).
	self classVersion: classVersion