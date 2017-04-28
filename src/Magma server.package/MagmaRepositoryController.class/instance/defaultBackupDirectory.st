accessing
defaultBackupDirectory
	"Answer the default backup directory, which is a sibling directory to mine, but named with an extension of my commitNumber."
	| myDir parentDir newDirName |
	myDir := self directory.
	parentDir := myDir containingDirectory.
	newDirName := myDir pathParts last , '.' , self commitNumber asString.
	^ parentDir / newDirName