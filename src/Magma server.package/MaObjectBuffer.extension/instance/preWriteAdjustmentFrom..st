*magma server
preWriteAdjustmentFrom: existingBuffer 
	"Called just before writing to disk.  Used to apply MagmaCounter deltas."
	self classId = MagmaClassIdManager magmaCounterClassId ifTrue: [ self updateSharedValueFrom: existingBuffer ]