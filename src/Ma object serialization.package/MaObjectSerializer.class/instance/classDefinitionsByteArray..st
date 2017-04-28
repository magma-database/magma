initializing
classDefinitionsByteArray: aByteArray
	"Initialize the receiver with aByteArray that materializes to my classDefinitions.  These are the classDefinitions used to work with objects that were being used when the user saved off the byteArray by calling the getter, #classDefinitionsByteArray."

	self classDefinitions: (self materializeGraph: aByteArray)