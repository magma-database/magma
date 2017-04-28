change sets
browseChangeSetNamed: nameString
	"Opens a code-file browser on the change-set named nameString."

	FileContentsBrowser browseStream: (self changeSetNamed: nameString)