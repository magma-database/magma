enumerating
associationsDo: aBlock
	array do: [ :b |
		b ifNotNil: [ b do: aBlock ]
	].
