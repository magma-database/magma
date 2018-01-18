labels
updateLabelColors
	| col |
	col := plot labelColor.
	{xLabels. 
	yLabels} do:
		[ : eachColl | eachColl do:
			[ : each | each color: col ] ]