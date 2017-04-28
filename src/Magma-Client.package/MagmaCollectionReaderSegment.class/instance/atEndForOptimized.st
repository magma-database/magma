testing
atEndForOptimized
	"Answer whether I contain the last element that satisfies the original expression.  The implementation is different for Optmized vs. Filtered Readers, this is for the optimized."
	^ trunkEnd + mergedCount >= lastKnownSize