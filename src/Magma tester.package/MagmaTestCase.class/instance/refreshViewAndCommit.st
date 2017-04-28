test refresh
refreshViewAndCommit
	"#refresh only wipes out changes made by other sessions.  MagmaCollection changes are never wiped out."
	refreshTestFixture second add: Object new.
	clientSession refresh.
	self
		assert: refreshTestFixture first notEmpty ;
		assert: refreshTestFixture second size = 2.
	refreshTestFixture first add: Object new.
	clientSession commit