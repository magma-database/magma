private
refreshAllWithOids: allKnownOids 
	"refreshAll:for: returns MaSerializedGraphBuffers but refreshChangedObjects: just wants the individual MaObjectBuffers.  Collect them up."
	| objectBuffers |
	"Calls refreshAll:for:."
	objectBuffers := (self secondarySubmit: (MaReadMultipleRequest new oids: allKnownOids)) collect: [ : each | each buffers first ].
	"Now select the ones which were changed by others."
	objectBuffers := objectBuffers select: [ : each | each commitNumber > self commitNumber ].
	self refreshChangedObjects: objectBuffers