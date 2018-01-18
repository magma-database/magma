series
series: aSymbol drawLine: aBoolean 
	"Find the appropriate series and set a property in it."

	(self series: aSymbol)
		drawLine: aBoolean.
	self changed