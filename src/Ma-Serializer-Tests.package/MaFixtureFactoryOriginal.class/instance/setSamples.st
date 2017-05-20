private collection samples
setSamples

	^Array
		with: Set new
		with: (Set new addAll: (self allNonCollectionSamples copyWithout: nil); yourself)
