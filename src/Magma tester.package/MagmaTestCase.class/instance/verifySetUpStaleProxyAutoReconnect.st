other small tests
verifySetUpStaleProxyAutoReconnect
	localRoot 
		at: 'testStaleProxyAutoReconnect'
		put: (clientSession abort root at: 'testStaleProxyAutoReconnect').
	self should: [ (localRoot at: 'testStaleProxyAutoReconnect') name maIsMutatingProxy ].
	clientSession disconnect.
	self should: 
		[ (localRoot at: 'testStaleProxyAutoReconnect') name asUppercase = 'BENNY' ]