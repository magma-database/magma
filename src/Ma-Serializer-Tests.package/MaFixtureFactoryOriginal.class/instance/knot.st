creation
knot
	"Answer an object that contains a graph of references that span every combination of class supported by Magma."

	| samples populatedDictionary |

	samples := OrderedCollection new.
	"First build collections that support addAll:"
	#(OrderedCollection Set Bag) do:
		[ :eachClassName |
		samples add: (
			(Smalltalk classNamed: eachClassName) new
				addAll: self allCollectionSamplesHoldingNonCollections;
				yourself) ].
	"Now do Array and Dictionary"
	samples add: self allCollectionSamplesHoldingNonCollections asArray.
	populatedDictionary := Dictionary new.
	self allCollectionSamplesHoldingNonCollections do:
		[ :each |
		populatedDictionary
			at: each
			put: populatedDictionary copy ].
	samples add: populatedDictionary.
	^samples
