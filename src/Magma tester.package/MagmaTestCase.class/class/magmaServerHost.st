accessing
magmaServerHost
	^ MagmaServerAddress 
		ifNil: [ MagmaServerAddress := self getHostNameFor: 'server' ]
		ifNotNil: [ MagmaServerAddress ]