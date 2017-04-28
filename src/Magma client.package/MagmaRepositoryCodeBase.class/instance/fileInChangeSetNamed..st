change sets
fileInChangeSetNamed: nameString

	| stream |
	stream := self changeSetNamed: nameString.
	stream reset.
	ChangeSorter
		newChangesFromStream: stream
		named: nameString