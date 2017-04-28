*magma-server
upgradeTo17At: aMagmaLocation 
	"Upgrade the model for the changes in -cmm.63.  MaClause was renamed to MagmaClause."
	| session |
	aMagmaLocation isLocal ifTrue:
		[ (MagmaRepositoryController open: aMagmaLocation) in:
			[ : cont | cont restoreMode ifTrue: [ cont commitRestore ].
			cont close ] ].
	session := aMagmaLocation newSession
		 allowWriteBarrier: false ;
		 connectAs: 'upgrade to 17' ;
		 yourself.
	[ (session definition classDefinitions anySatisfy:
		[ : each | each anyOne name = #MaClause ]) ifTrue:
		[ session commit:
			[ session
				mapLegacyInstancesOf: #MaClause
				to: MagmaClause ] ].
	session repositoryController repository filer version: 17 ] ensure: [ session disconnectAndClose ]