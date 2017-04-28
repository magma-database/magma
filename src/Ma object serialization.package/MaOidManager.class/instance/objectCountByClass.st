accessing
objectCountByClass
	^ (objects collect: [ : e | e class ]) asBag sortedCounts