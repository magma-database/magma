private accessing
allValues

	^ values
		inject: OrderedCollection new
		into:
			[ : coll : each |
			coll
				addAll: each;
				yourself ]