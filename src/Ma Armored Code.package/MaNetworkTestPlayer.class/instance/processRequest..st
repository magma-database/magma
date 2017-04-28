request framework requirements
processRequest: aMaNetworkTestPlayerRequest

	| result |
	self maMarked: 'magic'.  "This method called as part of test-script user-setup.  See MagmaTesterPackageInfo>>#readmeText."
	MaArmoredCodeNotification signal: 'Processing ', aMaNetworkTestPlayerRequest printString.
	result := aMaNetworkTestPlayerRequest processFor: self.
	^ result == testCase ifFalse: [ result ]