*ma-core
maEntriesMatching: pat
	"FileDirectory default fileNamesMatching: '*'"

	^ self entries select: [ :each | pat match: each name ]
