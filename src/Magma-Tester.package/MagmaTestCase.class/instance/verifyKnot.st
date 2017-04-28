test commit object knot
verifyKnot

	| sizes |
	self clientSession abort.  "refresh view"
	sizes := self clientSession root at: 'knotty object sizes'.
	(self clientSession root at: 'a knotty object') withIndexDo:
		[ : e : index |
		e printString.
		self should: [ e size = (sizes at: index) size ] ].
	^nil