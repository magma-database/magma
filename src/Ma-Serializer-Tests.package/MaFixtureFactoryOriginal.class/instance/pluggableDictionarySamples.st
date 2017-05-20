future support
pluggableDictionarySamples
	| populatedDictionary intKey |
	populatedDictionary := PluggableDictionary integerDictionary.
	intKey := -5.
	(self allNonCollectionSamples copyWithoutAll: {nil}) do:
		[ : each | populatedDictionary
			at: (intKey := intKey + 1)
			put: self allNonCollectionSamples ].
	^ Array
		with: PluggableDictionary integerDictionary
		with: populatedDictionary