actions
byteArrayIndexesFrom: startingEntryIndex to: endingEntryIndex do: oneArgBlock

	(self byteArrayIndexFor: startingEntryIndex)
		to: (self byteArrayIndexFor: endingEntryIndex)
		by: entrySize
		do: oneArgBlock
