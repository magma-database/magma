private
initializePrimaryLocation
	"Clients may send any request, including the initial connection request, to any respository in the node, primary or secondary.  Magma will adjust the receivers primaryLink and secondaryLink as necessary.  Whichever one the user connected to (primary or secondary), configure the other."
	(allowFailover and: [ self isLocal not ]) ifTrue:
		[ "did user connect to the primary?"
		primaryLink location = self node primaryLocation serverLocation
			ifTrue: [ self ensureSecondaryLinkConfigured ]
			ifFalse:
				[ "No, did they connect to one of the secondary locations?"
				self node secondaryLocations ifNotEmpty:
					[ : secondaryLocs | (secondaryLocs anySatisfy:
						[ : each | each serverLocation = secondaryLink location ]) ifTrue: [ "Yes, we have some valid link, set my primaryLink to what its supposed to be."
						self primaryLocation: self node primaryLocation ] ] ] ]