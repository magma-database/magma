start / stop
processOn: portInteger 
	"Start the Magma server listening on port portInteger."
	(controller isNil or: [ controller isOpen not ]) ifTrue: 
		[ MagmaUserError signal: 'The repository must be opened before the server can be started.' ].
	server := (MaNetworkRequestServer protocol: MagmaSession protocol) console: self.
	server 
		processOn: portInteger
		using: self