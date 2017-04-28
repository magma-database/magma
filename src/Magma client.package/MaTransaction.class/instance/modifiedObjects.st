private
modifiedObjects
	"Answers the collection of objects already in the commitPackage.  When WriteBarrier is in use, many objects are added *as* they are changed, via my #modified: method."
	^ commitPackage objects