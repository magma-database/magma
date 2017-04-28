accessing
inImageDefinition: aClass

	^ self
		inImageDefinition: aClass
		ifAbsent: [ self error: aClass name, ' is not part of my inImageDefinitions.' ]