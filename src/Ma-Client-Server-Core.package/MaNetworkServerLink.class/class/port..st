creation
port: portInteger 
	^ self
		host: NetNameResolver localHostName
		port: portInteger