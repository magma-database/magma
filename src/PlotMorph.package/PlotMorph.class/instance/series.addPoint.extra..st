series
series: aSymbol addPoint: aPoint extra: anObject 
	"Find the appropriate series and set a property in it."

	(self series: aSymbol)
		addPoint: aPoint
		extra: anObject.
	self changed 