accessing
magmaServerLocation
	^ MagmaRemoteLocation 
		host: NetNameResolver localHostName
		port: self defaultServerPort