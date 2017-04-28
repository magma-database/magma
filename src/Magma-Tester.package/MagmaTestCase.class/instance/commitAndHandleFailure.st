test transactions
commitAndHandleFailure
	self should: 
		[ 
		[ clientSession commit.
		false ] 
			on: MagmaCommitConflictError
			do: 
				[ : exception | 
				| fixture |
				fixture := localRoot at: #testTransactions.
				self
					should: [ exception result commitConflicts size = 1 ] ;
					should: 
						[ exception result commitConflicts first conflictingConnection userId = 'client1' ] ;
					should: 
						[ exception result commitConflicts first conflictingObjects asArray = {  (3 -> 'Three' -> (3 -> 'Threee'))  } ] ;
					should: [ (fixture at: 3) = (3 -> 'Three') ] ;
					should: [ (fixture at: 4) = (4 -> 'Four') ].
				true ] ].
	"client2 has observed the changes, decides they are good and will commit her 4->'Four' change."
	"But we have to do begin first because we are using a manual commit pattern.  If we had used commitAndBegin: true, then we would not need to do begin now."
	clientSession
		begin ;
		commit