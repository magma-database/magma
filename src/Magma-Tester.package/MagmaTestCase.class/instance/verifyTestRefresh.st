test refresh
verifyTestRefresh
	self assert: refreshTestFixture first size = 1.
	clientSession refresh.
	self
		assert: refreshTestFixture first size = 2 ;
		assert: refreshTestFixture second size = 2