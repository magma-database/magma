building
afterSerializingAny: className do: oneArgValuator 
	"Set up preference for serializing instances of class named className by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization."
	preferences
		afterSerializingAny: className
		do: oneArgValuator