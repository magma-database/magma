private
adjustCount: anInteger sum: aFloat 
	"Don't call super, we want to add to the delta's instead of count and sum."
	deltaSum := deltaSum + aFloat.
	deltaCount := deltaCount + anInteger