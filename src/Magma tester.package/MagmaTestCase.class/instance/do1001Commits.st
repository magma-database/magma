test misbehaving client
do1001Commits
	"Client 1 goes crazy on commits, causing client2 to get bumped."
	| arr |
	arr := self getMisbehaveFixture.
	MagmaRepositoryDefinition defaultMaximumNumberOfChallengers + 1 timesRepeat: [ clientSession commit: [ arr first value: arr first value not ] ].
	"This one should cause the server to terminate the client2 session."
	clientSession commit: 
		[ arr first value: 'client1 final value'.
		arr last value: 'client1 value wins' ]