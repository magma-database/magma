initializing
shutDown: aboutToQuit

	super shutDown: aboutToQuit.
	ActiveSockets do: [ :each | each primShutdown ]