private
lowestKeyAtIndex: entryIndex
	"Answer the lowest-possible key that can be stored at entryIndex."

	^ lowKey + (entryIndex * entryWeight // numberOfSlots)