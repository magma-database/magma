private
initializePrimaryLocation
	"Clients may send any request, including the initial connection request, to any respository in the node, primary or secondary.  Magma will adjust the receivers primaryLink and secondaryLink as necessary."
	(allowFailover and: [ self isLocal not ]) ifTrue: 
		[ self
			primaryLocation: self node primaryLocation ;
			ensureSecondaryLinkConfigured ]