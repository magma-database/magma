initializing
shutDown: aboutToQuit

	super shutDown: aboutToQuit.
	MagmaSession shutDown: aboutToQuit.
	OpenControllers
		do:
			[ :each | 
			[ MagmaNotification signal: 'closing Magma repository ', each pathName asString, '.  Will reopen on next startup.' ]
				on: MagmaNotification
				do: [ : noti | Transcript cr; show: noti messageText. noti pass ].
			each primClose ]