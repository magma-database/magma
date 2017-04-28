test misbehaving client
updateAt2Badly
	"Client 2 updates its portion, but doesn't commit."
	| arr |
	clientSession begin.
	arr := self getMisbehaveFixture.
	(arr at: 2) value: 'client2 desired change'.
	(arr at: 3) value: 'client2 gonna-fail change'