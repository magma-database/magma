*magma-server
process
	^ self repository 
		refreshAll: oids
		for: sessionId