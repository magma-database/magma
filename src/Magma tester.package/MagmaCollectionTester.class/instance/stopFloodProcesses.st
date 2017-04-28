test high-availability function
stopFloodProcesses
	{  'client1'. 'client2'  } do: [ : each | self remotePerform: #stopFloodProcess in: each ]