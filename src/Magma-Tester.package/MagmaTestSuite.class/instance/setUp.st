setup-teardown
setUp
"Force pre-initialization of keywordsSamples to ensure uniform across all images."
self tests anyOne keywordsSamples.
	initiateBackupPrereqsCompleted := Set new.
	verifyRestorePreqreqsCompleted := Set new.
	"Prevent accidental explosion of launching images!."
	MagmaRepositoryDefinition runningTestCases
		ifTrue: [ MagmaUserError signal: 'Already running test cases.' ]
		ifFalse: [ MagmaRepositoryDefinition runningTestCases: true ].
	MagmaSession cleanUp.
	(MagmaSession allInstances anySatisfy:
		[ : each | each isLocal ]) ifTrue: [ self halt: 'Must not have any local MagmaSessions when running tests.' ].
	MagmaPreferences debug: true.
	"Make sure multiple files get tested by reducing it way down."
	MaAtomicFileStream maxPhysicalFileSize: 30000.
	"Make sure we test recovery requiring it to allocate extra space for recovery records."
	MaRecoveryManager defaultRecordSize: 25.
	super setUp.
	orchestra isConductorImage
		ifTrue:
			[ self
				createRepository: self environmentDirectory
				root: Dictionary new.
			self ensureNoContactMethodsAttribute.
			orchestra
				 pushClass: (Smalltalk classNamed: #MagmaContact) ;
				 pushClass: (Smalltalk classNamed: #MagmaPerson).
			(orchestra playerNamed: 'server')
				 remotePerform: #removeDomainClasses ;
				
				remotePerform: #startServer:
				with: true.
			tests anyOne connectClients ]
		ifFalse:
			[ (#('server' 'server2' ) anySatisfy:
				[ : each | (orchestra playerNamed: each) isHome ]) ifTrue: [ (Smalltalk at: #MagmaCollectionIndex) maRecursiveRemove ].
			#('client1' 'client2' ) do:
				[ : each | (orchestra playerNamed: each) isHome ifTrue: [ self removeServerPackage ] ] ]