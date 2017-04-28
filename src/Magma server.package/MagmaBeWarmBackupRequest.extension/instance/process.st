*magma server
process
	console ifNil: 
		[ MagmaEnvironmentError signal: 'MagmaServerConsole required for ' , self class name ].
	primaryLocation isLocal ifTrue: 
		[ MagmaUserError signal: 'Warm-backup of a locally-used repository is not supported.' ].
	console beWarmBackupFor: primaryLocation