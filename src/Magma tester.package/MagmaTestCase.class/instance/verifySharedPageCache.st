test forwarding proxys
verifySharedPageCache
	"Ensure that, if two separate MagmaForwardingProxies refer to the same oid assert that, when the realObject is first materialized in one, that it is the identical (==) realObject of the other."
	| otherSession forwardingProxy otherForwardingProxy |
	clientSession abort.
	forwardingProxy := clientSession root at: #testForwardingProxy.
	otherSession := self newSessionAt: self class magmaServerLocation.
	otherSession connectAs: 'spcVerifier'.
	otherForwardingProxy := otherSession root at: #testForwardingProxy.
	self
		deny: forwardingProxy == otherForwardingProxy ;
		assert: forwardingProxy = otherForwardingProxy ;
		assert: forwardingProxy realObject == otherForwardingProxy realObject.
	otherSession disconnect