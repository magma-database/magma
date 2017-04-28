building
addNewClass: aClass 
	"Answer the storage definition created for aClass."
	aClass isMeta ifTrue: [ MaObjectSerializationSoftwareError signal: 'Metaclass instances are not stored here.' ].
	^ self addClassDefinition: (self newDefinitionNamed: aClass name)