test forwarding proxys
commitForwardingProxy
	| sessionB fwProxy verifierSession |
	sessionB := MagmaSession 
		host: (self getHostNameFor: 'peer')
		port: self peerPort.
	sessionB allowWriteBarrier: self class allowWriteBarrier.
	sessionB connectAs: 'peer creator'.
	fwProxy := sessionB root asMagmaForwardingProxy.
	clientSession commit: 
		[ clientSession root 
			at: #testForwardingProxy
			put: sessionB root asMagmaForwardingProxy ].
	sessionB disconnect.
	self assert: (clientSession definition links anySatisfy: 
			[ : each | 
			each = fwProxy fpRemoteMagmaId and: [ each ~~ fwProxy fpRemoteMagmaId ] ]).
	verifierSession := self newSessionAt: clientSession location.
	verifierSession connectAs: 'verifier'.
	self assert: (verifierSession definition links anySatisfy: [ : each | each = fwProxy fpRemoteMagmaId ]).
	verifierSession disconnect.	"Above assertion should NOT cause sessionB to reconnect."
	self deny: sessionB isConnected