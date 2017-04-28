operators
upTo: highObject
	lowKey := 0.
	highKey := (self index indexHashForIndexObject: highObject) - 1 max: 0.