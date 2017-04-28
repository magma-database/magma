operators
from: lowObject upTo: highObject

	lowKey := self index indexHashForIndexObject: lowObject.
	highKey := (self index indexHashForIndexObject: highObject) - 1 max: 0.