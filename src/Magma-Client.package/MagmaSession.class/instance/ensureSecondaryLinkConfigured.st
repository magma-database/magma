private
ensureSecondaryLinkConfigured
	"Private - If allowFailover is set, and a secondary server is available, initialize my secondaryLink accordingly."
	(self node isNil or: [ (self node includesSecondary: (MagmaRemoteLocation location: secondaryLink location)) not ]) ifTrue:
		[ self secondaryLocation:
			(allowFailover
				ifTrue:
					[ self node isBackedUp
						ifTrue: [ self node anySecondaryLocation ]
						ifFalse: [ self node primaryLocation ] ]
				ifFalse: [ MagmaRemoteLocation location: primaryLink location ]) ]