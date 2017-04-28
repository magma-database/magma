private collection samples
orderedCollectionSamples

	^Array
		with: OrderedCollection new
		with: (OrderedCollection new addAll: self allNonCollectionSamples; yourself)
