private
adjustValues: aFloat 
	"Don't call super, we want to add to the delta's instead of count and sum."
	self
		adjustCount: 1
		sum: aFloat