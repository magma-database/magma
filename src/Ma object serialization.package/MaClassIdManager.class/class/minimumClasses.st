accessing
minimumClasses
	"These are the classes required to transmit a MaClassDefinition, used to establish protocol between two images."
	^ { Metaclass.  Class.  MaClassReference.  MaClassDefinition.
	"These atomic types are needed for backward compatibility with version 8."
	Boolean. SmallInteger. Character. Float. UndefinedObject.
	Array. #size class. '' class. ByteArray. Set.  OrderedCollection. Dictionary.
	"Added these at the end for backward compatibility.  Boolean was not the right one, you need the exact classes!"
	True. False } 