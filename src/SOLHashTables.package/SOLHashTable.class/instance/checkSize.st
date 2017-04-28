private
checkSize
	"Consider expanding the table, based on numElements, approxLoadFactor and number of buckets (from keyMask)."
	numElements > (keyMask + 1 * approxLoadFactor) ifTrue: [ self widen ]