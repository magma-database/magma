operators
> anObject
	lowKey := (self index indexHashForIndexObject: anObject)+1.
	highKey := self index highestPossibleKey