private
processFor: aMaNetworkTestPlayer

	^aMaNetworkTestPlayer
		remotePerform: self selector
		withArguments: self arguments
