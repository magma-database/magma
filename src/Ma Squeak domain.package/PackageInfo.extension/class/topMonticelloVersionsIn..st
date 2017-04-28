*ma squeak domain
topMonticelloVersionsIn: aCollection 
	"In aCollection of Monticello DirectoryEntryFiles, answer a Dictionary of the top version of each package name."
	| entriesByName |
	entriesByName := Dictionary new.
	aCollection do: 
		[ : eachDirectoryEntryFile | 
		| mcEntry existing |
		mcEntry := McFilename on: eachDirectoryEntryFile name.
		mcEntry isValid ifTrue: 
			[ existing := entriesByName 
				at: mcEntry packageName
				ifAbsentPut: [ eachDirectoryEntryFile ].
			(McFilename on: existing name) versionNumber < mcEntry versionNumber ifTrue: 
				[ entriesByName 
					at: mcEntry packageName
					put: eachDirectoryEntryFile ] ] ].
	^ entriesByName