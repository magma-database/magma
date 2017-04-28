testing
differsByOtherThan: allowedKeys 
	"Answer whether my objects differ by attributes _besides_ the ones specified by allowedKeys."
	| allowedCollection |
	allowedCollection := allowedKeys asCollection.
	^ self differenceKeys anySatisfy:
		[ : each | (allowedCollection includes: each) not ]