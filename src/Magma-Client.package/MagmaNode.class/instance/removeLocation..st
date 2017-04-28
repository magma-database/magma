updating
removeLocation: aMagmaRemoteLocation 
	| session |
	locations := locations copyWithout: aMagmaRemoteLocation.
	session := self sessions 
		removeKey: aMagmaRemoteLocation
		ifAbsent: [ nil ].
	session ifNotNil: [ session disconnect ]