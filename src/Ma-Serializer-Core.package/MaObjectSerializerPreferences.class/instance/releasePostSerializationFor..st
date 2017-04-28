pre and post processing
releasePostSerializationFor: className
	"Remove all post-materialization behaviors for the class named className."
	postSerializers
		removeKey: className
		ifAbsent: [ "ok" ]