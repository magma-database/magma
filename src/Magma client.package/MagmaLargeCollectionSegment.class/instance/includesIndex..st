testing
includesIndex: anInteger 
	"Answer whether logical anInteger-index falls within the range of indices currently covered by me."
	^ self endIndex notNil and: 
		[ anInteger 
			between: startIndex
			and: self endIndex ]