peer
startPeer

	peerConsole :=
		MagmaServerConsole new 
			open: self peerPath ;
			processOn: self peerPort ;
			yourself