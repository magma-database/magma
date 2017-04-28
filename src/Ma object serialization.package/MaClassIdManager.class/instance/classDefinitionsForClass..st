accessing
classDefinitionsForClass: aClass

	aClass isMeta ifTrue: [ MaObjectSerializationSoftwareError signal: 'Metaclass instances are not stored here.' ].
	^ self classDefinitionsForId: (self idForClass: aClass)