accessing
icons
	^ self class iconSelectors collect:
		[ : each | self perform: each ]