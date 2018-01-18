series
series: aSymbol addPoint: aPoint 
	"Find the appropriate series and set a property in it."

	(self series: aSymbol)
		addPoint: aPoint.
	self changed