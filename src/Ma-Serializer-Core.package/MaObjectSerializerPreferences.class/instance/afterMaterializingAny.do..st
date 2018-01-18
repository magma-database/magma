pre and post processing
afterMaterializingAny: className do: oneArgValuator
	"Set up preference for materializing instances of the class named className by sending oneArgValuator.  The first argument is the object being serialized, the second is the serializer (aMaObjectSerializer) doing the serialization."

	| valuators |
	self
		validate: className
		has: #maWantsPostMaterialization.
	valuators := 
		(postMaterializers
			at: className
			ifAbsentPut: [ OrderedCollection new ]).
	(valuators includes: oneArgValuator) ifFalse: [ valuators add: oneArgValuator ]