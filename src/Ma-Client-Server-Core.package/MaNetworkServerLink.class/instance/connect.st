connections
connect
	"Request and establish protocol from server."
	| idAndProtocol |
	super connect.
	idAndProtocol := self primSubmit: self connectionRequest.
	"Shouldn't need to re-establish protocol if it was just a socket timeout."
	self protocolEstablished ifFalse:
		[ serializer
			 resetOidManager ;
			 classDefinitionsByteArray: (idAndProtocol at: 2).
		serializer classIdManager beImmutable ]