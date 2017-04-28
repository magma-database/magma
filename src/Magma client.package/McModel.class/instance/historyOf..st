definitions
historyOf: aMCDefinition 
	"Answer a Collection of the versions of aMCDefinition."
	| history |
	history := objects
		at: aMCDefinition description
		ifAbsent: [ Array empty ].
	^ aMCDefinition sortHistory: history