private
serverReadStrategy
	"Make sure the indexes stays a proxy because the server will not necessarily have the full MagmaCollectionIndex hierarchy."
	^ (MaReadStrategy minimumDepth: 1)
		forVariableNamed: 'changes'
			onAny: MagmaCollection
			readToDepth: 99999 ;
		forVariableNamed: 'indexes'
			onAny: MagmaCollection
			readToDepth: -1 ;
		forVariableNamed: 'descriptions'
			onAny: MagmaCollection
			readToDepth: 99999 ;
		"For MagmaIdRequest"
		onAny: MagmaId
			readToDepth: 99999 ;
		yourself
