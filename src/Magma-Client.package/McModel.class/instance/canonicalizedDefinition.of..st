private
canonicalizedDefinition: aMCDefinition of: aMCVersion 
	"Find or create a canonicalized definitions for aMCVersion."
	| existing |
	existing := objects
		at: {#definition. 
			aMCDefinition}
		ifAbsent:
			[ existing := aMCDefinition ensureHistoricalEntryIn: self.
			objects
				at: {#definition. 
					aMCDefinition}
				put: existing ].
	self
		checkAndRecordOriginOf: existing
		for: aMCVersion.
	^ existing