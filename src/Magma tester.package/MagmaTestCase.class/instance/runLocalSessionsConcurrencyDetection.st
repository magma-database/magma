test local sessions
runLocalSessionsConcurrencyDetection
	| session1 session2 location |
	location := MagmaLocalLocation path: self localDbName.
	"Quick test of MagmaLocalLocation #=, get the controller by looking it up that way."
	session1 := MagmaSession repositoryController: (MagmaRepositoryController controllerOpenedOn: location).
	session1 allowWriteBarrier: self class allowWriteBarrier.
	session1 connectAs: 'session1'.
	session2 := MagmaSession repositoryController: session1 repositoryController.
	session2 connectAs: 'session2'.
	
	[ session1 begin.
	session1 root 
		at: #foo
		put: #bar.
	session2 commit: 
		[ session2 root 
			at: #foo
			put: #baz ].
	self 
		should: [ session1 commit ]
		raise: MagmaCommitConflictError ] ensure: 
		[ session1 disconnectAndClose.
		session2 disconnectAndClose ]