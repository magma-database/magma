testing
hasXbetween: low and: high 
	^ self points anySatisfy:
		[ : each | each x
			between: low
			and: high ]