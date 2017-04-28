test rollback recovery
copyDb
	"This method is used only to assist with debugging problems with recovery."
	| location targetDir |
	location := magmaConsole controller localLocation.
	targetDir := FileDirectory on: (location directory containingDirectory fullNameFor: location directory localName , 'Copy').
	targetDir assureExistence.
	[ MagmaRepositoryController delete: targetDir pathName ] 
		on: MagmaDeleteWarning
		do: [ : warning | warning resume ].
	location fileNames do: 
		[ : each | 
		location directory 
			maCopyFileNamed: each
			toDirectory: targetDir ]