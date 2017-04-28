transactions
commitAndBegin: aBoolean 
	"Calls submitAll:for:beginAnother:"
	| commitPackage commitResult |
	guard critical: 
		[ self inNestedTransaction ifTrue: 
			[ "nested transaction commit, essentially does nothing"
			aBoolean ifFalse: [ self decrementTransactionLevel ].
			^ self ].
		self inTransaction ifFalse: [ MagmaUserError signal: 'No transaction to commit.' ].
		self statistics clientSideCommitTimeHistory addValue: (Time millisecondsToRun: [ commitPackage := self newCommitPackageFor: transaction ]).
		serializer validateNextOid.
		[ 
		[ self
			ensureConnected ;
			dropStrongReferences ;
			resetTransactionLevel.
		aBoolean ifTrue: [ self incrementTransactionLevel ].
		commitResult := self submit: (MaCommitRequest new
				package: commitPackage ;
				beginAnother: aBoolean ;
				yourself) ] ifCurtailed: [ self refreshDefinition ].
		self resetMagmaCollectionChanges ] 
			on: MagmaCommitConflictError
			do: 
				[ : exception | 
				exception result populateConflictingObjectsFromOidsUsing: serializer.
				self 
					refreshViewUsing: exception result
					includingLocal: false.
				exception signal ].
		(commitPackage hasNewIndexes or: [ commitPackage hasRemovedIndexes ]) 
			ifTrue: 
				[ commitResult ifNotNil: 
					[ self 
						processNewAndRemovedIndexesIn: commitPackage
						using: commitResult ] ]
			ifFalse: 
				[ commitResult ifNotNil: 
					[ self 
						refreshViewUsing: commitResult
						includingLocal: true ] ] ]