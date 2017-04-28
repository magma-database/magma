*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"Materialize the DiskProxy which computes a reference to an appropriate object in this materializing system."

	| diskProxy |
	diskProxy := aMaObjectSerializer materializeGraph: aByteArray.
	^ diskProxy comeFullyUpOnReload: nil