high-availability
thisLocation
	"Answer the MagmaRemoteLocation in the node that represents this running server."
	^ MagmaRemoteLocation 
		host: NetNameResolver localHostName
		port: self port