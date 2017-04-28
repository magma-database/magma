building
beforeSerializingAny: className do: oneArgValuator 
	"Set up preference for serializing instances of Class named className by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization."
	preferences
		beforeSerializingAny: className
		do: oneArgValuator