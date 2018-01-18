*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"This method exists to mirror the logic in my instance-side #objectForDataStream, whereby a DiskProxy is stored instead.  For Ma object serialization, this was done on my instance-side in #maAsStorageObject."

	| diskProxy |
	diskProxy := aMaObjectSerializer materializeGraph: aByteArray.
	^ diskProxy comeFullyUpOnReload: nil