private-reporting
historicalStatRowSpec
	^ MaFixedWidthRowSpecification new
		addColumn: self endTimeColumn ;
		addColumn: self historicalStatNameColumn ;
		addColumn: self countColumn ;
		addColumn: self minColumn ;
		addColumn: self maxColumn ;
		addColumn: self sumColumn ;
		addColumn: self meanColumn ;
		addColumn: self lastColumn