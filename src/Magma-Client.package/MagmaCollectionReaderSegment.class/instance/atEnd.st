testing
atEnd
	"Answer whether I contain the last element that satisfies the original expression."
	^ trunkEnd isNil "empty" 
	or: [ lastKnownSize notNil ]