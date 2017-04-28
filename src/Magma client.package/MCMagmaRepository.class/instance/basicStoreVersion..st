framework
basicStoreVersion: aMCVersionOrConfiguration 
	self ensureConnectedSession commit: [ self mcModel storeVersion: aMCVersionOrConfiguration ].
	aMCVersionOrConfiguration postStoreCleanUpFor: self