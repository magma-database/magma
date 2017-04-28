private
refreshSpecialObjectsUsing: anArrayOfByteArrays 
	"each ByteArray is a graph buffer of either the entire classDefinitionsById, OR merely one of the OrderedCollections of the definitions for a particular id/class."
	anArrayOfByteArrays do: 
		[ : each | 
		| gb specialObject |
		"Materialize the full-graph of each special-object."
		specialObject := serializer materializeGraph: each.
		gb := MaSerializedGraphBuffer byteArray: each.
		self refreshChangedObjects: gb buffers ]