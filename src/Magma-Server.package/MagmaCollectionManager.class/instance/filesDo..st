recovery
filesDo: twoArgBlock 
	super filesDo: twoArgBlock.
	oidIndexes withIndexDo: 
		[ : each : x | 
		each filesDo: 
			[ : eachIndexFile | 
			twoArgBlock 
				value: eachIndexFile
				value: 
					(self 
						fileIdForOids: true
						index: x) ] ].
	keyIndexes withIndexDo: 
		[ : each : x | 
		each filesDo: 
			[ : eachIndexFile | 
			twoArgBlock 
				value: eachIndexFile
				value: 
					(self 
						fileIdForOids: false
						index: x) ] ]