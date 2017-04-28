test refresh
setUpTestRefresh
	refreshTestFixture := { 
		(OrderedCollection new).
		(MagmaCollection new)
	 }.
	clientSession
		commit: 
			[ clientSession root 
				at: #testRefresh
				put: refreshTestFixture ] ;
		begin