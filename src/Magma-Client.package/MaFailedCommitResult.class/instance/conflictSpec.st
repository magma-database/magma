private
conflictSpec
	^ MaFixedWidthRowSpecification new
		addColumn: self sessionIdColumn ;
		addColumn: self userIdColumn ;
		yourself