accessing
nextPrimaryLocation
	"The first is always the primary.  The second is always the next primary.  When the first fails, it is removed and the second becomes the first, the primary."
	^ self locations size > 1 ifTrue: [ self locations second ]