definitions
originOf: aMCDefinition 
	"Answer the MCVersion object which aMCDefinition was originally committed."
	^ objects
		at: {#origin. aMCDefinition}
		ifAbsent: [ nil ]