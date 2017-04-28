test node equivalence
testNodeEquivalence
	| equivalentLocations |
	equivalentLocations := { 
		(MagmaRemoteLocation 
			host: NetNameResolver localHostName
			port: 123).
		(MagmaRemoteLocation 
			host: NetNameResolver localHostAddress maAsIpString
			port: 123).
		(MagmaRemoteLocation 
			host: '127.0.0.1'
			port: 123).
		(MagmaRemoteLocation 
			host: '127.0.1.1'
			port: 123).
		(MagmaRemoteLocation 
			host: 'localhost'
			port: 123).
	 }.
	self assert: (equivalentLocations collect: [ : each | each hash ]) asSet size = 1.
	self assert: equivalentLocations asSet size = 1