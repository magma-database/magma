private
refreshAllWithOids: allKnownOids accumulatingConflictsIn: aMaFailedCommitResult 
	"refreshAll:for: returns MaSerializedGraphBuffers but refreshChangedObjects: just wants the individual MaObjectBuffers.  Collect them up."
	"Calls refreshAll:for:."
	| objectBuffers myCommitNumber |
	objectBuffers := (self secondarySubmit: (MaReadMultipleRequest new oids: allKnownOids)) collect:
		[ : each | each buffers first ].
	"Now select the ones which were changed by others."
	myCommitNumber := self commitNumber.
	objectBuffers := objectBuffers select:
		[ : each | each commitNumber > myCommitNumber ].
	objectBuffers sort:
		[ : a : b | a commitNumber < b commitNumber ].
	objectBuffers do:
		[ : eachBuffer | self
			check: eachBuffer
			using: MagmaClientConnection unknown
			accumulatingConflictsInto: aMaFailedCommitResult ].
	aMaFailedCommitResult populateConflictingObjectsFromOidsUsing: serializer.
	self
		refreshChangedObjects: objectBuffers
		includingLocal: false