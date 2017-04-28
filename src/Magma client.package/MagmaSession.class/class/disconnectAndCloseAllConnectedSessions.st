initializing
disconnectAndCloseAllConnectedSessions

	ConnectedSessions ifNotNil:
		[ ConnectedSessions copy do: [ : each | each disconnectAndClose ] ]