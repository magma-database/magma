create
host: hostName port: anInteger

	^ self location:
		(MagmaRemoteLocation
			host: hostName
			port: anInteger)