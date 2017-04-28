test forward recovery
verifyFloodProgress: aMagmaServerLocation 
	"Get entirely new MagmaSession client instances, to be sure we aren't reading cached data."
	self
		disconnectClients ;
		connectClients: aMagmaServerLocation.
	{  'client1'. 'client2'  } do: 
		[ : each | 
		self 
			remotePerform: #verifyAddedStrings
			in: each ]