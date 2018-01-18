private non-collection samples
symbolSamples

	^Array
		with: #size
		with: #with:with:with:with:
		with: #'hello there'
		"with: '' asSymbol  <- conflicts with empty String sample since, in Squeak, they're equal.."
