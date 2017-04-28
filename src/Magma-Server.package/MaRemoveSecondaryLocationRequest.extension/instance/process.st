*magma-server
process
	console ifNil: 
		[ MagmaUserError signal: 'This operation is only applicable to secondary servers in a multi-server HA Node configuration.' ].
	console removeSecondaryLocation: locationToRemove.
	^ true