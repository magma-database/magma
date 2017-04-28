*ma object serialization
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"A simpler, alternative way to store a direct global reference than using DiskProxy."

	^ SystemOrganization