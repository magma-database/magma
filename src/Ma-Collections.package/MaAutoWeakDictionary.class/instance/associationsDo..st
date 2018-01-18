enumerating
associationsDo: aBlock
	self finalizeValues. "make sure we're clean before iterating"
	array do: [ :b |
		b ifNotNil: [ b do: aBlock ]
	].
