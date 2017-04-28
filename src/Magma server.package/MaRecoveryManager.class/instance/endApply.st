record
endApply
	self preMadeEndApplyRecord
		groupId: groupId ;
		writeTo: applyFile.
	applyFile flush.
	self deleteFilesQueuedForDelete.
	"Ok, this group is a wrap.  We can now start back at the beginning."
	applyFile position: 0.
	serializer resetOidManager