pre and post processing
afterSerializingAny: className do: oneArgValuator
	"Set up preference for serializing instances of class named className by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization."

	| valuators |
	self
		validate: className
		has: #maWantsPreSerialization.
	valuators := postSerializers
		at: className
		ifAbsentPut: [ OrderedCollection new ].
	(valuators includes: oneArgValuator) ifFalse: [ valuators add: oneArgValuator ]