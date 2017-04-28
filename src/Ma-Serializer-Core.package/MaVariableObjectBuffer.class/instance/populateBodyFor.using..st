building
populateBodyFor: storageObject using: aMaObjectSerializer
	"Logical storage of collections varies by collection, therefore dispatch back to it."
	storageObject
		maStreamVariablyInto: self
		for: aMaObjectSerializer