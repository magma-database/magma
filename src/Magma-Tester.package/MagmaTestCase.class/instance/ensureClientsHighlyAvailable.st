test high-availability function
ensureClientsHighlyAvailable
	#('client1' 'client2' ) do: 
		[ : each | 
		self 
			remotePerform: #ensureClientHighlyAvailable
			in: each ]