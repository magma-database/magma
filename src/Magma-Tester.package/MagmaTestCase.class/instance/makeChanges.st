test refresh
makeChanges
	| oc mc |
	clientSession abort.
	refreshTestFixture := clientSession root at: #testRefresh.
	oc := refreshTestFixture first.
	mc := refreshTestFixture second.
	clientSession commit: 
		[ oc add: Object new.
		mc add: Object new ]