*ma-serializer-core
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"This method exists to mirror the logic in my instance-side #objectForDataStream:, whereby if the organizer being stored has a normal Class subect, a DiskProxy is stored instead.  For Ma object serialization, this was done on my instance-side in #maAsStorageObject.  If I was not stored as the DiskProxy, then I would not get to this method."

	| diskProxy |
	diskProxy := aMaObjectSerializer materializeGraph: aByteArray.
	^ diskProxy comeFullyUpOnReload: nil