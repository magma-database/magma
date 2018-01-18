accessing
mean
	"The average value."
	^ self count = 0 ifFalse: [ (self sum / self count) ]