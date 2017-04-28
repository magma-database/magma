*ma-serializer-core
maMaterializeFrom: aMaByteObjectBuffer using: aMaObjectSerializer
	"This is the standard-case for building a skeleton of a variable-byte-sized object."
	^ aMaByteObjectBuffer asByteObject: self