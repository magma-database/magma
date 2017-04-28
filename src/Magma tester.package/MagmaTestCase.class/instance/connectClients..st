initialize-release
connectClients: aMagmaRemoteLocation 
	self 
		remotePerform: #connect:as:
		withArguments: {  aMagmaRemoteLocation. 'client1'  }
		in: 'client1'.
	self 
		remotePerform: #connect:as:
		withArguments: {  aMagmaRemoteLocation. 'client2'  }
		in: 'client2'