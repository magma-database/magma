private collection samples
bagSamples

	^Array
		with: Bag new
		with: (Bag new addAll: (self allNonCollectionSamples copyWithout: nil); yourself) ;
		with: (Bag new add: 'a small bag' withOccurrences: 9999999999; yourself)