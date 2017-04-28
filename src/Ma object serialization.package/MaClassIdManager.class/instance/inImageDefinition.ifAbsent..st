accessing
inImageDefinition: aClass ifAbsent: aBlock

	^ inImageDefinitions
		at: (aClass isMeta ifTrue: [ Metaclass ] ifFalse: [ aClass ])
		ifAbsent: aBlock