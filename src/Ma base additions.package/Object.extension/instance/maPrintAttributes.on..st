*ma base additions
maPrintAttributes: arrayOfSymbols on: aStream

	arrayOfSymbols do:
		[ :each |
		self
			maPrintAttribute: each
			on: aStream ]
