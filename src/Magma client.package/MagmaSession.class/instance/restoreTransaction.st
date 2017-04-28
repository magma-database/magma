private
restoreTransaction
	self inTransaction ifTrue: 
		[ | saveTransactionLevel |
		saveTransactionLevel := transactionLevel.
		"We must reset the transactionLevel so #begin will work."
		
		[ 
		[ self
			resetTransactionLevel ;
			begin ] 
			on: MagmaAlreadyInTransaction
			do: 
				[ : err | 
				"This could happen if the network couldn't deliver the response on a commit.  We're in the state we want, don't complain."
				 ] ] ensure: [ transactionLevel := saveTransactionLevel ] ]