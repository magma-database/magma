pre and post processing
beforeSerializingAny: className do: oneArgValuator
	"Set up preference for serializing instances of aClass by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization.
	Note, only do this if aClass is present."

	| valuators |
	self
		validate: className
		has: #maWantsPreSerialization.
	valuators := 
		preSerializers
			at: className
			ifAbsentPut: [ OrderedCollection new ].
	(valuators includes: oneArgValuator) ifFalse: [ valuators add: oneArgValuator ]