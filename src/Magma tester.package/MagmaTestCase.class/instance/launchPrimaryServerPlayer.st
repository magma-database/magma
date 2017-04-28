test forward recovery
launchPrimaryServerPlayer
	self class launchImageNamed: self class serverImageFilename.
	[ (self playerLinkNamed: 'server') isReady ] whileFalse: 
		[ MagmaTesterNotification signal: 'waiting for server to recover..'.
		(Delay forSeconds: 2) wait ]