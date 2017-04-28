private
processAddsIn: aMagmaArrayChanges using: aMaCommitResult 
	aMagmaArrayChanges additionsDo: 
		[ : eachIndex : eachOid | 
		memberIndex 
			at: eachIndex
			put: eachOid ]