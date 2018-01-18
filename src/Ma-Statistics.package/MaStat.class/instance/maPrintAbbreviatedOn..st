printing
maPrintAbbreviatedOn: aStream

	self
		maPrintAttributes: #(min max sum count mean)
		on: aStream