private
checkAndRecordOriginOf: aMCDefinition for: aMCVersion 
	"Record the most-ancestral (e.g. oldest)-known origin of aMCDefinition, or as aMCVersion if there is no known origin."
	| originKey currentOrigin |
	originKey := {#origin. aMCDefinition}.
	currentOrigin := objects
		associationAt: originKey
		ifAbsent: [ nil ].
	currentOrigin
		ifNil:
			[ objects
				at: originKey
				put: aMCVersion ]
		ifNotNil:
			[ currentOrigin value:
				(self
					olderOf: aMCVersion
					and: currentOrigin value) ]