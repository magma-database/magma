private
iconSelectors
	^ ((self methodsInCategory: 'icons') select:
		[ : e | e isUnary ]) asSortedCollection