private
loadChangeSet: fileName

	| oldChanges file |
	oldChanges := ChangeSet current.
	ChangeSet newChanges: (ChangeSorter assuredChangeSetNamed: 'MagmaTestClasses').
	file := self resourcesDirectory readOnlyFileNamed: fileName.
	[ file 
		maFileInAnnouncing: 'Loading ', file localName
		logged: false ] 

		ensure:
			[ file close.
			ChangeSet newChanges: oldChanges ]