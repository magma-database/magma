creation
host: hostName port: portInteger 
	^ self location: 
		(MaServerLocation 
			host: hostName
			port: portInteger)