actions
populateBodyFor: storageObject using: aMaObjectSerializer

	self
		replaceFrom: 1
		to: storageObject size
		with: storageObject
		startingAt: 1