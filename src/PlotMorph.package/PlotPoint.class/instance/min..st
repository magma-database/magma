comparing
min: aPoint 
	"Answer the lower right corner of the rectangle uniquely defined by the receiver and the argument, aPoint.  This is sent by PlotMorph>>#minPoint."
	^ (self x min: aPoint x) @ (self minY min: aPoint minY)