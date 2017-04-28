definitions
revisionsOf: aMCDefinition 
	"Answer a Collection of the versions of aMCDefinition."
	^ (objects
		at: aMCDefinition description
		ifAbsent: [ Array empty ]) sort: [ : a : b | a dateAndTime > b dateAndTime ]