transactions
abort
	"Abort the current transaction.  Objects are updated to their persistent state in the repository."
	"This guard is needed for when we initially connect to the repository because we can't abort before the connection is made."
	guard critical:
		[ self
			 dropStrongReferences ;
			 resetTransactionLevel.
		transaction restore.
		self isConnected ifTrue:
			[ | request additional |
			additional := Array streamContents:
				[ : stream | transaction commitPackage objectsDo:
					[ : each | | oid |
					oid := serializer
						oidFor: each
						ifAbsent: [  ].
					oid ifNotNil: [ stream nextPut: oid ] ] ].
			request := MaAbortTransactionRequest new additionalBuffers: additional.
			"Calls #abortTransactionFor:."
			self
				refreshViewUsing: (self submit: request)
				includingLocal: true ] ]