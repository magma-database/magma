MagmaCollectionReaders may have access to thousands of objects, so it is necessary to only represent a page at a time.

endIndex - Readers are accessible by #at:, my endIndex represents the index of the last element in this segment.

highestKey - the Integer key of the last element in this segment.

mergedCount - a positive Integer representing the number of objects added.  Number of objects removed is not indicated by this, they are indicated instead by decrements of the endIndex.

trunk - The MaQueryTrunk for the expression.  The "trunk" represents all of the indexes and the key-ranges that must be enumerated to test all objects potentially valid for my readers expression.

trunkEnd:  The ending Integer index position within the trunk this segment represents.

trunkStart:  The starting Integer index position within the trunk this segment represents.
