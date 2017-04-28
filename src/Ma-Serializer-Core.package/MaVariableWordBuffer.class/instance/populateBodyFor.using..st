accessing
populateBodyFor: storageObject using: aMaObjectSerializer
	1
		to: storageObject maInstSize
		do:
			[ :index |
			self
				wordAt: index
				put: (storageObject wordAt: index) ]