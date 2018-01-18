access
expired
	"Answer whether the waiting period before executing my do block has elapsed.  It does not indicate whether the do block has executed or not."
	^ self started and: [ monitor critical: [ expired ] ]