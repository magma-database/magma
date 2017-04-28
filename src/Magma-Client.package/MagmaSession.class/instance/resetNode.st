high-availability
resetNode
	self commit:
		[ self magmaId resetNode.
		self definition links ifNotNil:
			[ : links | links do:
				[ : each | each resetNode ] ] ]