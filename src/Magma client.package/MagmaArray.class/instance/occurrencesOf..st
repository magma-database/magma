do not use
occurrencesOf: anObject
	"This should not be used because, being large and non-indexed, would be a performance drain.  If you need this, you should probably use a regular MagmaCollection."

	self shouldNotImplement