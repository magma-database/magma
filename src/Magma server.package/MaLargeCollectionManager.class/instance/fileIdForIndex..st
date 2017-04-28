recovery
fileIdForIndex: anInteger
	"To support recovery, we must populate MaBeforeImageRecords with a fileId, which identifies which file it is a before-image of.  We have eight bytes available for this.  The high-order 6 bytes are my collectionOid, the low-order two bytes indicate which index of the collection it is.  0 is the memberIndex."
	^ (self collectionOid bitShift: 16) + anInteger