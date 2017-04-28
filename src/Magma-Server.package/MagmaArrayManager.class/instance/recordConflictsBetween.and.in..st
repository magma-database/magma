overriding
recordConflictsBetween: aMagmaArrayChanges and: challengingCommitLogEntry in: myCommitLogEntry 
	"For MagmaArray's, different sessions may update the Array as long as they update different indexes."
	(challengingCommitLogEntry hasChangesToMagmaArray: aMagmaArrayChanges collectionOid) ifTrue: 
		[ | foreignChanges |
		foreignChanges := challengingCommitLogEntry magmaArrayChangesAt: aMagmaArrayChanges collectionOid.
		aMagmaArrayChanges additionsDo: 
			[ : eachIndex : eachOid | 
			((foreignChanges includesObject: eachIndex) and: [ (foreignChanges added at: eachIndex) ~= eachOid ]) ifTrue: 
				[ "this user tried to put a different oid at the same index, conflict!"
				myCommitLogEntry 
					failResultWith: challengingCommitLogEntry connection
					on: aMagmaArrayChanges collectionOid ] ] ]