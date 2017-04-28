building
appendCount: aNumber of: aString
	"aString should be a non-plural word.  This method will append the
	plural version of aString (by simply adding 's') if aNumber is > 1."

	self
		append: aNumber;
		space.
	self
		appendProperlyPluralized: aString
		for: aNumber
