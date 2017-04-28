*ma base additions
maConsistsOf: aCollection
	"Answer whether the receiver and aCollection reference all equal
	objects, including the same number of references to those objects.  Order
	is not a factor."

	^self size = aCollection size and: [ self maIncludesAll: aCollection ]
