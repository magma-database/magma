accessing
classDefinitionsForId: anInteger

	^ self
		classDefinitionsForId: anInteger
		ifAbsent: [ MaObjectSerializationSoftwareError signal: 'class-definition not found' ]