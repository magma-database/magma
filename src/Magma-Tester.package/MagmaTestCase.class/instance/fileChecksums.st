test rollback recovery
fileChecksums
	| answer location sha |
	answer := Dictionary new.
	sha := SecureHashAlgorithm new.
	location := magmaConsole controller localLocation.
	location fileNames do: 
		[ : eachFilename | 
		| file |
		({  '.images'.  MaRecoveryManager commitLogExtension } anySatisfy: [ : eachExtension | eachFilename endsWith: eachExtension ]) ifFalse: 
			[ file := (location directory readOnlyFileNamed: eachFilename) binary.
			answer 
				at: eachFilename
				put: (sha hashStream: file).
			file close ] ].
	^ answer