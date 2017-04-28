*magma-client
initializeImmutabilityStrategy: aMaImmutabilityStrategy using: aMaTransaction 
	"Populate aMaImmutabilityStrategy's immutables as best we can from existing cached objects."
	aMaImmutabilityStrategy resetImmutables.
	self cachedObjectsDo:
		[ : each | aMaImmutabilityStrategy
			rememberImmutableReferencesFrom: each
			for: aMaTransaction ]