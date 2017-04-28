accessing
magmaServer2Location
	^ MagmaRemoteLocation 
		host: NetNameResolver localHostName
		port: self defaultServer2Port