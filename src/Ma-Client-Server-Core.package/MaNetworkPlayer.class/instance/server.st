private
server
	^ server ifNil:
		[ "Set a high timeout to try to avoid the 'port already in use' error.  The socket-accept is at a higher priority.  It will wait up to that long to establish a connection but if the image has already exited, it will fail fast even with this long timeout."
		server := (MaNetworkRequestServer protocol: orchestra protocol)
			 timeoutSeconds: 600 ;
			 yourself ]