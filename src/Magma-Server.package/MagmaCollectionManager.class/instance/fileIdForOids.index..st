private
fileIdForOids: aBoolean index: anInteger
	"To support recovery, we must populate MaBeforeImageRecords with a fileId identifying which file it is a before-image of.  We have eight bytes available for this.  The high-order 48-bits are my collectionOid, the low-order 15 bits indicate which index of the collection it is.  0 is the memberIndex.  For the other indexes (where lower-order 15 bits > 0), bit 16 is 1 for keys, 0 for oids."
	| isKeysBit indexId |
	isKeysBit := 16.
	(anInteger maIsBitSet: isKeysBit) ifTrue: 
		[ MagmaSoftwareError signal: 'Cannot have more than ' , ((0 maBitSet: isKeysBit) - 1) printString , ' indexes for a single collection.' ].
	indexId := aBoolean 
		ifTrue: [ anInteger ]
		ifFalse: [ anInteger maBitSet: isKeysBit ].
	^ (self collectionOid bitShift: 16) + indexId