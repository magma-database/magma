as yet unclassified
checkTree: tree array: pairArray
	pairArray withIndexDo:
		[:pair :i |
		tree at: pair first put: pair second.
		self assert: tree size = i.
		"self assertConsistent: tree.
		self assertSorted: tree"].
	pairArray shuffled do:
		[:pair |
		self assert: (tree at: pair first) = pair second].
	self assert: tree size = pairArray size.
	self assertConsistent: tree.
	self assertSorted: tree.
	^ tree
	
	 