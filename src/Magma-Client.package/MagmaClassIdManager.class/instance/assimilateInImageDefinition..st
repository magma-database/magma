event handling
assimilateInImageDefinition: aClass
	aClass isMeta ifTrue: [ MagmaSoftwareError signal: 'Metaclass instances are not stored here.' ].
	self addClassDefinition: (self inImageDefinition: aClass)