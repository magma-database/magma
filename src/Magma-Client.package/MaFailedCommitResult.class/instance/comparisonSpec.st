private
comparisonSpec
	^ MaFixedWidthRowSpecification new
		addColumn: self oidColumn ;
		addColumn: self objectColumn ;
		yourself