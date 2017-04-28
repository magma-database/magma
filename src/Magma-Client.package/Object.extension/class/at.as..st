*magma-client
at: aMagmaRemoteLocation as: userId 
	^ aMagmaRemoteLocation newSession
		 connectAs: userId ;
		 root