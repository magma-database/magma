test misbehaving client
do1001Commits
	"Client 1 goes crazy on commits, causing client2 to get bumped."
	| arr adminSession client2Connections |
	arr := self getMisbehaveFixture.
	MagmaRepositoryDefinition defaultMaximumNumberOfChallengers timesRepeat:
		[ clientSession commit:
			[ (arr at: 4) withIndexDo:
				[ : eachStat : index | eachStat addValue: index ] ] ].
	adminSession := clientSession location newAdminSession.
	client2Connections := adminSession connections select: [ : each | each userId = 'client2' ].
	self
		 assert: client2Connections size = 1 ;
		 assert: client2Connections first challengingBytes > 0.
	"This one should cause the server to terminate the client2 session."
	clientSession commit:
		[ (arr at: 1) value: 'client1 final value'.
		(arr at: 3) value: 'client1 value wins' ].
	client2Connections := adminSession connections select: [ : each | each userId = 'client2' ].
	self assert: client2Connections size = 0.
	self
		 assert: ((arr at: 4) at: 1) sum = 1000 ;
		 assert: ((arr at: 4) at: 2) sum = 2000 ;
		 assert: ((arr at: 4) at: 3) sum = 3000