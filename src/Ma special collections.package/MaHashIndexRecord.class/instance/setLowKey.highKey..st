private
setLowKey: lowKeyInteger highKey: highKeyInteger

	lowKey := self lowKey.
	highKey := self highKey.
	canHoldDuplicateKeys := (highKey - lowKey + 1) < numberOfSlots.
	entryWeight := highKey - lowKey + 1