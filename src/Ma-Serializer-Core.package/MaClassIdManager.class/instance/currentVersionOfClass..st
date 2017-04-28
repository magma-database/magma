accessing
currentVersionOfClass: aClass

	aClass isMeta ifTrue: [ MaObjectSerializationSoftwareError signal: 'Metaclass instances are not stored here.' ].
	^ (self
		inImageDefinition: aClass
		ifAbsent: [ ^ 1 ]) version