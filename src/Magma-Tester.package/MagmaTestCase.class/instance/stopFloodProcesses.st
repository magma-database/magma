test forward recovery
stopFloodProcesses
	{  'client1'. 'client2'  } do: [ : each | self remotePerform: #stopFloodProcess in: each ]