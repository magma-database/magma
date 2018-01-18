actions
byteArrayIndexesFrom: startingEntryIndex do: oneArgBlock

	self
		byteArrayIndexesFrom: startingEntryIndex
		to: numberOfSlots - 1
		do: oneArgBlock