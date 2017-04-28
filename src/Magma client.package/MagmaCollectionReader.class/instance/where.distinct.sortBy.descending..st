accessing
where: aBlock distinct: makeDistinct sortBy: attributeSymbol descending: shouldDescend 
	^ ((self where: aBlock)
		sortBy: attributeSymbol makeDistinct: makeDistinct)
		descending: shouldDescend ;
		yourself