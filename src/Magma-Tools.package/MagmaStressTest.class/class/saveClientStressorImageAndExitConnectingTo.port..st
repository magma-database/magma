run
saveClientStressorImageAndExitConnectingTo: hostName port: portInteger
	| conf loc |
	conf := MagmaStressTestConfiguration new
		objectsPerCommit: 10 ;
		yourself.
	loc := MagmaRemoteLocation 
		host: hostName
		port: portInteger.
	MagmaStressTest 
		prepareStressors: {  conf  }
		at: loc
		andSaveClientStressorAs: self clientStressorImageName