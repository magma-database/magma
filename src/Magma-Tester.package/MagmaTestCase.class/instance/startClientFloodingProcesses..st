test forward recovery
startClientFloodingProcesses: expectNetworkError 
	{  'client1'. 'client2'  } do: 
		[ : each | 
		self 
			remotePerform: #startAddStrings:
			with: expectNetworkError
			in: each ]