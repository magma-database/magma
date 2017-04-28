test misbehaving client
client2CommitAnyway
	"Client 2 should now be kicked off, even if isConnected doesn't know it."
	| arr |
	self assert: clientSession isConnected.
	arr := self getMisbehaveFixture.
	self assert: clientSession inTransaction.
	self assert: (arr at: 3) value = 'client2 gonna-fail change'.
	"Force client2 to access the server.  By now, though, the server should have terminated client2's session, so a NetworkError is expected.  So this tests the auto-reconnection and included image update."
	self 
		should: [ clientSession commit ]
		raise: NetworkError.
	self deny: clientSession inTransaction.
	clientSession begin.
	"The reconnect will performed a required 'roll-forward', exposing client1's change dominating at index 3.  Fortunately, however, client2's desired change is still intact, with the transaction ready to commit the 'merged' model.."
	self
		assert: clientSession inTransaction ;
		assert: (arr at: 3) value = 'client1 value wins' ;
		assert: (arr at: 2) value = 'client2 desired change'.
	"However, client1 never changed arr at: 2, so although client2 has been refreshed with changes, its own changes are preserved.  Now, let's finally commit this restarted transaction."
	clientSession commit