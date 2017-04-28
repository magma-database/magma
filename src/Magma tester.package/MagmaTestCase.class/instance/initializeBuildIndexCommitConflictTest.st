test transactions
initializeBuildIndexCommitConflictTest
	| objects |
	objects := (100 
		to: 35000
		by: 5) collect: [ : n | n -> n asWords ].
	clientSession commit: 
		[ clientSession root
			at: 'BuildIndexCommitConflictTest_objects'
				put: objects ;
			at: 'BuildIndexCommitConflictTest_mc'
				put: 
					(MagmaCollection new
						addAll: objects ;
						yourself) ].
	clientSession begin.
	"Prevent garbage collection."
	original34990 := objects at: 6979