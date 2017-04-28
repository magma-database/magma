test become
xtestBecome
self maMarked: 'dev'.  "This test fails.  Magma is not expecting differently shaped objects when it refreshes its objects.  For the future..  maybe."
	self
		remotePerform: #setUpTestBecome
		in: 'client1'.
	self
		remotePerform: #become
		in: 'client2'.
	self
		remotePerform: #verifyBecome
		in: 'client1'