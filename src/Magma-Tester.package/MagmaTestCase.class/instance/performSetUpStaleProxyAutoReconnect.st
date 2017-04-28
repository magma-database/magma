other small tests
performSetUpStaleProxyAutoReconnect
	clientSession abort commit: 
		[ clientSession root 
			at: 'testStaleProxyAutoReconnect'
			put: (MagmaPerson new
					name: 'Benny' ;
					address: '10 Volcanoes Drive' ;
					yourself) ]