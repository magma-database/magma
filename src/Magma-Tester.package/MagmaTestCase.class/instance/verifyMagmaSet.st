test MagmaSet
verifyMagmaSet

	| ms newEntries |
	ms := clientSession refresh root at: 'testMagmaSet'.
	newEntries := self magmaSetEntries.
	self should: [ ms size = newEntries size ].
	newEntries do:
		[ : each |
		self should: [ ms includes: each ] ].
	self shouldnt: [ ms includes: 'three'-> 'different value' ].
	self shouldnt: [ ms includes: 'four'->4 ].
	self shouldnt: [ ms includes: Object new ].
	self
		should: [ ms add: 'one'->1 ]
		raise: MagmaDuplicateObjectInCollection.
	"Do a simple remove test too."
	newEntries do:
		[ : each | 
		clientSession commit: [ ms remove: each ] ].
	self should: [ ms isEmpty ]