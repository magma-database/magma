connections
connect
	"Request and establish protocol from server."
	| idAndProtocol |
	super connect.
	idAndProtocol := self primSubmit: self connectionRequest.
	serializer
		resetOidManager ;
		classDefinitionsByteArray: (idAndProtocol at: 2).
	serializer classIdManager beImmutable