comparing
max: aPoint 
	"Answer the lower right corner of the rectangle uniquely defined by the receiver and the argument, aPoint."
	^ (self x max: aPoint x) @ (self y max: aPoint maxY)