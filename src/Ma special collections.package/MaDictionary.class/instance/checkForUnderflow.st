private
checkForUnderflow
	tally < (array size / 4) ifTrue: [ self rehash: (self bestArraySizeFor: tally * 2 +1). ]
	