debugging
buffers

	| coll |

	coll := OrderedCollection new.
	self buffersDo: [ :each | coll add: each independentCopy ].
	^coll
