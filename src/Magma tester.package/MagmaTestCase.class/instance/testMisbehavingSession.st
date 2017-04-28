test misbehaving client
testMisbehavingSession
	"Make sure the server will protect itself from misbehaving clients."
	| client2Id |
	self
		remotePerform: #initTestMisbehavingSession
			in: 'client1' ;
		remotePerform: #updateAt2Badly
			in: 'client2' ;
		remotePerform: #do1001Commits
			in: 'client1'.
	client2Id := self 
		remotePerform: #getSessionId
		in: 'client2'.
	self deny: (self 
			remotePerform: #repositoryHasConnectionFor:
			with: client2Id
			in: 'server').
	self
		remotePerform: #client2CommitAnyway
			in: 'client2' ;
		remotePerform: #verifyClient2Change
			in: 'client1'