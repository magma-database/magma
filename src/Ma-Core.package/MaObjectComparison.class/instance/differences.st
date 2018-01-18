testing
differences
	^ differences ifNil:
		[ differences := self object1
			differencesWith: self object2
			using: comparisonOperator ]