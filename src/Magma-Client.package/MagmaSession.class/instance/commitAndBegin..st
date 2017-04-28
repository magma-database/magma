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
		[ [ self
			 ensureConnected ;
			 dropStrongReferences.
		commitResult := self submit:
			(MaCommitRequest new
				 package: commitPackage ;
				 beginAnother: aBoolean ;
				 yourself) ] ifCurtailed: [ self refreshDefinition ].
		self resetTransactionLevel.
		aBoolean ifTrue: [ self incrementTransactionLevel ].
		self resetMagmaCollectionChanges ]
			on: MagmaCommitError
			do:
				[ : exception | self
					 bulkBecomeProxies ;
					 refreshDefinition ;
					 resetTransactionLevel.
				aBoolean ifTrue: [ self incrementTransactionLevel ].
				exception result populateConflictingObjectsFromOidsUsing: serializer.
				self
					refreshViewUsing: exception result
					includingLocal: false.
				exception handleOrPassUsing: self ].
		(commitPackage hasNewIndexes or: [ commitPackage hasRemovedIndexes ])
			ifTrue:
				[ commitPackage hasRemovedIndexes ifTrue: [ "Give server time to flush so old index files will be deleted."
					(Delay forSeconds: 5) wait ].
				commitResult ifNotNil:
					[ self
						processNewAndRemovedIndexesIn: commitPackage
						using: commitResult ] ]
			ifFalse:
				[ commitResult ifNotNil:
					[ self
						refreshViewUsing: commitResult
						includingLocal: true ] ] ]