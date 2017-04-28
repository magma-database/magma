event handling
handleClassModification: aModifiedClassDefinitionEvent

	aModifiedClassDefinitionEvent isModified ifFalse: [ ^ self ].
	aModifiedClassDefinitionEvent item isMeta ifTrue: [ ^ self ].
	oidManager
		handleClassModification: aModifiedClassDefinitionEvent item
		using: self.
	classIdManager
		handleClassModification: aModifiedClassDefinitionEvent item
		using: self