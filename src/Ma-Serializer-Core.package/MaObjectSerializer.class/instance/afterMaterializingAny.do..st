building
afterMaterializingAny: className do: oneArgValuator 
	"Set up preference for materializing instances of the class named className by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization."
	preferences
		afterMaterializingAny: className
		do: oneArgValuator