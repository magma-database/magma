private
challenge: aBoolean entriesWith: aMaCommitLogEntry 
	"We record all objects that were committed to all the entries in the receiver.  Some of the entries are in transaction, some are not.  The ones that are will use aMaCommitLogEntry to verify their commit has no conflicts with this entry.  The ones that are not will use the result of the receiver to know which objects need refreshed."
	| entriesToRemove |
	entriesToRemove := nil.
	self entriesDo: 
		[ : each | 
		(each isForSameSessionAs: aMaCommitLogEntry) ifFalse: 
			[ each hasExcessiveChallengers 
				ifTrue: 
					[ entriesToRemove ifNil: [ entriesToRemove := OrderedCollection new ].
					entriesToRemove add: each ]
				ifFalse: 
					[ (aBoolean or: [ each isSystem ]) ifTrue: [ each addChallengingEntry: aMaCommitLogEntry ].
					each 
						recordChangesToSpecialObjectsIn: aMaCommitLogEntry
						using: self ] ] ].
	^ entriesToRemove