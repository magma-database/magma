private
handleFailedLink: failedMaNetworkServerLink 
	"Handle the situation where aMaNetworkServerLink received a NetworkError when trying to access it.  If it is a link to the primary, we set my primaryLink to the second server, if aMaNetworkServerLink is a link to a warm backup, set it to any other secondary or, if none available, the primary.  Answer the new link to try next."
	| answer primaryFailed |
	self node ifNil: [ ^ failedMaNetworkServerLink ].
	self isHighlyAvailable ifFalse: [ ^ failedMaNetworkServerLink ].
	primaryFailed := false.
	answer := failedMaNetworkServerLink == primaryLink 
		ifTrue: 
			[ primaryFailed := true.
			"primaryLink should be a link to the second location, so we don't have different clients with different notions about who should be the next primary.  If that is what secondaryLink already is, we don't need to re-init it."
			primaryLink := self node nextPrimaryLocation 
				ifNil: [ secondaryLink ]
				ifNotNilDo: 
					[ : nextLoc | 
					secondaryLink location = nextLoc serverLocation 
						ifTrue: [ secondaryLink ]
						ifFalse: 
							[ self node nextPrimaryLocation newServerLink
								preferences: primaryLink preferences copy ;
								yourself ] ] ]
		ifFalse: 
			[ "Secondary failed, look for a different secondary or, if none, use the primary."
			| otherAvailableSecondarys |
			otherAvailableSecondarys := self node locations allButFirst.
			secondaryLink := otherAvailableSecondarys 
				maDetect: [ : each | (each serverLocation = secondaryLink location) not ]
				ifFound: 
					[ : foundLocation | 
					foundLocation newServerLink
						preferences: secondaryLink preferences copy ;
						yourself ]
				ifNone: [ primaryLink ] ].
	"Tell whoever is primary now to update the Node."
	primaryFailed ifTrue: 
		[ "Inform the primary of the failed location so the node can be updated prior to attempting reconnection."
		primaryLink submit: (MagmaNoteUnreachableServer new failedLocation: (self node locationMatching: failedMaNetworkServerLink location)) ].
	^ answer