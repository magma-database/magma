overriding
isAbstract
	^ super isAbstract or: [ self name = #MaNetworkTestCase ]