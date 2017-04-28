initialize-release
close
	clientSession ifNotNil: [ self clientSession disconnectAndClose ].
	magmaConsole ifNotNil: [ self stopServer ].
	peerConsole ifNotNil: [ self stopPeer ]