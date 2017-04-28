create
at: aMagmaLocation start: startBlockArg enumerate: enumerateBlock check: checkBlock repair: repairBlock 
	^ self new
		setLocation: aMagmaLocation
		startBlock: startBlockArg
		enumerateBlock: enumerateBlock
		checkBlock: checkBlock
		repairBlock: repairBlock