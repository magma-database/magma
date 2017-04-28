serializing
object: anObject toStream: aWriteStream 
	"Serialize anObject onto aWriteStream, taking care to ensure any Proxies are reified first, so that the entire graph is serialized.  Answer the final MaSerializedGraphBuffer."
	| objectGb anyProxyEncountered |
	[ anyProxyEncountered := nil.
	objectGb := [ self serializeGraph: anObject ]
		on: MaTraverseProxyNotification
		do:
			[ : noti | anyProxyEncountered := noti proxy.
			anyProxyEncountered realObjectIfMutatingProxy.
			noti resume ].
	anyProxyEncountered yourself. "one force bulkBecome"
	anyProxyEncountered notNil ] whileTrue.
	objectGb buffersMissingFromWhole ifNotEmpty:
		[ : missing | MaSoftwareError signal: 'Incomplete graph, check serializer configuration.' ].
	"serialize protocol and object in succession."
	aWriteStream
		 nextPutAll: self classDefinitionsByteArray ;
		 nextPutAll: objectGb byteArray.
	^ objectGb