serializing
object: anObject toStream: aWriteStream 
	"Serialize anObject onto aWriteStream, taking care to ensure any Proxies are reified first, so that the entire graph is serialized.  Answer the final MaSerializedGraphBuffer."
	| objectGb proxiesEncountered |
	[ proxiesEncountered := false.
	objectGb := [ self serializeGraph: anObject ]
		on: MaTraverseProxyNotification
		do:
			[ : noti | noti proxy realObjectIfMutatingProxy.
			proxiesEncountered := true.
			noti resume ].
	proxiesEncountered ] whileTrue.
	objectGb buffersMissingFromWhole ifNotEmpty:
		[ : missing | MaSoftwareError signal: 'Incomplete graph, check serializer configuration.' ].
	"serialize protocol and object in succession."
	aWriteStream
		 nextPutAll: self classDefinitionsByteArray ;
		 nextPutAll: objectGb byteArray.
	^ objectGb