private accessing
allCollectionSamplesHoldingNonCollections

	^(self methodsInCategory: 'private collection samples')
		inject: OrderedCollection new
		into:
			[ :coll :each |
			coll
				addAll: (self perform: each selector);
				yourself ]
