private creation - domain objects
methodsInCategory: aString do: twoArgBlock

	(self methodsInCategory: aString) do:
		[ : each |
		twoArgBlock
			value: each methodSymbol
			value: (self perform: each methodSymbol) ]