*ma object serialization
maSerializationClass
	"All objects that can be serialized by Ma object serialization have their classes recorded mapped to an id except for Classes instances.  The class for these objects maps directly to Metaclass, rather than their specific metaclass instance."
	^ self maOriginalClass