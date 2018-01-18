accessing
comparisonOperator: operatorSymbol
	comparisonOperator = operatorSymbol ifFalse:
		[ comparisonOperator := operatorSymbol.
		self resetDifferences ]