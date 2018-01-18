start / stop
shutDownPlayers
	 players do:
		[ : each | [ each
			remotePerform: #snapshot:andQuit:
			withArguments: {false. true}.
		each disconnect ]
			on: NetworkError
			do: [ : err | "ignore it" ] ]