as yet unclassified
testAtPutDelegatingCollection
	| coll |
	coll := OrderedCollection new: 5.
	coll add: 'bar'.
	self enableWriteBarrier: coll.
	coll at: 1 put: 'foo'.
	self denyChanged: coll.
	1 to: 100 do: [:i | coll add: i].
	self assertChanged: coll