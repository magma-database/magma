test misbehaving client
updateAt2Badly
	"Client 2 updates its portion, but doesn't commit."
	| arr |
	clientSession begin.
	arr := self getMisbehaveFixture.
	(arr at: 2) value: 'client2 desired change'.
	(arr at: 3) value: 'client2 gonna-fail change'.
	(arr at: 4) withIndexDo:
		[ : eachStat : index | eachStat addValue: 0 - 2000 ].
	self
		 assert: ((arr at: 4) at: 1) sum = (0 - 2000) ;
		 assert: ((arr at: 4) at: 2) sum = (0 - 2000) ;
		 assert: ((arr at: 4) at: 3) sum = (0 - 2000)