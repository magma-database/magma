private
differenceSpec
	^ MaFixedWidthRowSpecification new
		addColumn: self attributeColumn ;
		addColumn: self winningValueColumn ;
		addColumn: self losingValueColumn ;
		yourself