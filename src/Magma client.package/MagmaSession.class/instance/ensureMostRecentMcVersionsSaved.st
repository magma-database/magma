code base
ensureMostRecentMcVersionsSaved
	"Ensure all of the currently-loaded versions of MC packages are committed to this Magma repository."
	MCWorkingCopy allManagers
		do:
			[ : eachWorkingCopy | eachWorkingCopy ancestors do:
				[ : eachVersionInfo | self commit:
					[ (MCRepositoryGroup default versionWithInfo: eachVersionInfo)
						ifNil: [ MagmaWarning signal: eachVersionInfo name , ' not found in RepositoryGroup default.' ]
						ifNotNilDo:
							[ : ver | self mcModel storeVersion: ver ] ] ] ]
		displayingProgress:
			[ : eachWorkingCopy | 'Saving ' , eachWorkingCopy name ]