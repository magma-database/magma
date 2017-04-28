private tests
verifyKeyValuePairs

	self indexKeys
		with: self indexValues
		do: [ : eachKey : eachValue | self should: [ (values at: eachKey) includes: eachValue ] ]
