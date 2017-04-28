*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"This method exists to mirror the logic in Association>>#objectForDataStream, whereby if the Array being stored is a Smalltalk global, a DiskProxy is stored instead.  For Ma object serialization, this was done on my instance-side in #maAsStorageObject.  If I was not stored as the DiskProxy, then I would not get to this method."

	| diskProxy |
	diskProxy := aMaObjectSerializer materializeGraph: aByteArray.
	^ diskProxy comeFullyUpOnReload: nil