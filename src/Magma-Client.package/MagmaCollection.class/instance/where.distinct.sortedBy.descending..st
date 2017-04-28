accessing
where: aBlock distinct: makeDistinct sortedBy: attributeSymbol descending: shouldDescend 
	| answer |
	answer := self 
		where: aBlock
		distinct: makeDistinct
		sortBy: attributeSymbol
		descending: shouldDescend.
	[ answer sortComplete ] whileFalse: [ (Delay forMilliseconds: 400) wait ].
	^ answer