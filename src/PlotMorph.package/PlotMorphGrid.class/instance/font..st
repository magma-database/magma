accessing
font: aFont 
	{xLabels. 
	yLabels} do:
		[ : eachColl | eachColl do:
			[ : each | each font: aFont ] ]