*ma object serialization
maMaterializeFrom: aMaByteObjectBuffer using: aMaObjectSerializer
	"This is the standard-case for building a skeleton of a variable-byte-sized object."
	^ aMaByteObjectBuffer asString asSymbol