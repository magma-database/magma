*ma base additions
maDetectFile: whereBlock ifFound: foundBlock ifNone: noneBlock 
	^ (self maFindEntries: whereBlock) 
		ifEmpty: noneBlock
		ifNotEmptyDo: [ : results | foundBlock value: results anyOne ]