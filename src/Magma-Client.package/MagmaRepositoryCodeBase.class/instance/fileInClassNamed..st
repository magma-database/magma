class fileouts
fileInClassNamed: nameString

	| stream |
	stream := self classNamed: nameString.
	stream reset.
	stream fileInAnnouncing: 'loading class ', nameString, ' from Magma database.'