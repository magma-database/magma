testing
isMemberOfMinimumClasses: aClass
	aClass isMeta ifTrue: [ MaObjectSerializationSoftwareError signal: 'Metaclass instances are not stored here.' ].
	^ minimumClasses includes: aClass