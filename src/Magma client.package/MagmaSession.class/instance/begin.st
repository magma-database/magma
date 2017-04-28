transactions
begin
	"Begin a new transaction.  To commit changes to the repository, a transaction is required.  After performing this message, changes may be made to objects, followed by a a #commit (or #commitAndBegin), which will cause any changes made to be saved to the repository and visible to others."
	| refreshViewResult |
	guard critical: 
		[ "If highlyAvailable, and primaryLink not connected, do not initially connect with a begin, otherwise #ensureConnected will #restoreTransaction, leading to a 'Already in transaction error'."
		(self isHighlyAvailable and: [ primaryLink isConnected not ]) ifTrue: [ self refresh ].
		self
			ensureConnected ;
			incrementTransactionLevel.
		self inNestedTransaction ifTrue: [ ^ self ].
		"Calls #newTransactionFor:."
		refreshViewResult := [ self submit: MaTransactionRequest new ] 
			on: Error
			do: 
				[ : err | 
				self decrementTransactionLevel.
				err pass ].
		self 
			refreshViewUsing: refreshViewResult
			includingLocal: false ]