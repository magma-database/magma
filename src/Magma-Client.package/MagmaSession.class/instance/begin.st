transactions
begin
	"Begin a new transaction.  To commit changes to the repository, a transaction is required.  After performing this message, changes may be made to objects, followed by a a #commit (or #commitAndBegin), which will cause any changes made to be saved to the repository and visible to others."
	| refreshViewResult |
	guard critical:
		[ self incrementTransactionLevel.
		self inNestedTransaction ifTrue: [ ^ self ].
		self ensureConnected.
		"Calls #newTransactionFor:."
		refreshViewResult := [ self submit: MaTransactionRequest new ]
			on: MagmaAlreadyInTransaction
			do: [ : err | "This happens when the session got disconnected while in a transaction.  #ensureConnected, above, called #restoreTransaction which restored this sessions CommitLogEntry in the server." ]
			on: Error
			do:
				[ : err | self decrementTransactionLevel.
				err pass ].
		refreshViewResult ifNotNil:
			[ self
				refreshViewUsing: refreshViewResult
				includingLocal: false ] ]