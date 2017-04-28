private
addLargeCollectionChangesTo: aMaCommitPackage

	largeCollectionChanges do:
		[ :each |
		each hasChanges
			ifTrue:
				[ aMaCommitPackage
					addLargeCollectionChanges: each
					using: session ] ]