private
resetCachedBoundaries
	self plots do:
		[ : each | each resetCachedBoundaries ]