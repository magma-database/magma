initialize-release
initializeLink: port
	link := (MaNetworkServerLink port: port)
		protocol: orchestra protocol ;
		timeoutSeconds: orchestra timeoutSeconds ;
		yourself.
	link ping ifTrue: [ MaClientServerEnvironmentError signal: port asString, ' appears to already be in use.' ]