connections
isSameRepositoryAs: anotherMagmaSession

	^ anotherMagmaSession hasDefinition
	and: [ definition magmaId = anotherMagmaSession magmaId ]