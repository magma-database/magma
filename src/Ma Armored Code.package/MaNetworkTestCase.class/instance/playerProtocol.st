accessing
playerProtocol
	^ ((MaNetworkTestPlayerRequest allSubclasses
		add: UndefinedObject ;
		yourself) asSortedCollection: [ : a : b | a name < b name ]) asArray