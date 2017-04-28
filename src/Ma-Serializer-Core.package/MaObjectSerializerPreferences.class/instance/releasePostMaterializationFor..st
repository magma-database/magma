pre and post processing
releasePostMaterializationFor: className
	"Remove all post-materialization behaviors for the class named className."
	postMaterializers
		removeKey: className
		ifAbsent: [ "ok" ]