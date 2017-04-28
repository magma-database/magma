creation
name: aString host: hostName port: anInteger testCaseClass: aClass 
	^ self new
		name: aString ;
		testCaseClass: aClass ;
		link: (MaNetworkServerLink location: (MaServerLocation 
					host: hostName
					port: anInteger)) ;
		yourself