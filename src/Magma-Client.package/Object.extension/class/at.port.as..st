*magma-client
at: host port: port as: userId 
	^ self
		at:
			(MagmaRemoteLocation
				host: host
				port: port)
		as: userId