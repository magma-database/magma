test misbehaving client
initTestMisbehavingSession
	"Make a three-element Array of Associations for each client to play with.  Position 1 is for client1, position 2 is for client2, position 3 will be the conflicting element (client1 will win)."
	clientSession commit: 
		[ clientSession root 
			at: #testMisbehavingSession
			put: { 
					('client1' -> true).
					('client2' -> 'this should not be here at the end of the test!').
					('conflict' -> 'initial value').
					{ MagmaStat new. MagmaStat new. MagmaStat new}
				 } ]