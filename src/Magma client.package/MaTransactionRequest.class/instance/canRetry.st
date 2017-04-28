testing
canRetry
	"A retry here on a timeout would result in a guaranteed error once the original bytes made it, so don't retry."
	^ false