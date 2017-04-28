setup-teardown
createOrchestra
	| orch testCase |
	testCase := self tests anyOne.
	orch := (MaNetworkOrchestra name: '_' , self suiteName , 'Test')
		 protocol: testCase playerProtocol ;
		 timeoutSeconds: 172800 ;
		 onePlayerImage: false ;
		 firstPort: self startingPort ;
		 yourself.
	self playerNames do:
		[ : each | orch addPlayer:
			(MaNetworkPlayer new
				 name: each ;
				 server:
					((MaNetworkRequestServer protocol: orch protocol)
						 processor: testCase ;
						 yourself)) ].
	^ orch