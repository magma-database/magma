series
series: aSymbol drawPoints: aBoolean 
	"Find the appropriate series and set a property in it."

	(self series: aSymbol)
		drawPoints: aBoolean.
	self changed