pre and post processing
releasePreserializationFor: className
	"Remove all preserialization behaviors for the Class named className."
	preSerializers
		removeKey: className
		ifAbsent: [ "ok" ]