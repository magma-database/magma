player setup
addPlayer: aMaNetworkPlayer 
	players add: aMaNetworkPlayer.
	aMaNetworkPlayer setOrchestra: self.
	^ aMaNetworkPlayer