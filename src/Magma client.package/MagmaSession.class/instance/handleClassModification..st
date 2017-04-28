private
handleClassModification: aModifiedClassDefinitionEvent 
	guard critical: 
		[ aModifiedClassDefinitionEvent isModified ifFalse: [ ^ self ].
		aModifiedClassDefinitionEvent item isMeta ifTrue: [ ^ self ].
		serializer handleClassModification: aModifiedClassDefinitionEvent.
		self prepareReadStrategy ]