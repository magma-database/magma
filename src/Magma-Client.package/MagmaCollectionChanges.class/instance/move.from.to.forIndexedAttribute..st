building
move: anObject from: oldHashValues to: newHashValues forIndexedAttribute: aSymbol

	self changedKeys
		add: (
			MaChangedKeySpecification
				object: anObject
				attribute: aSymbol
				oldHashValues: oldHashValues
				newHashValues: newHashValues)