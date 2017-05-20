private collection samples
sortedCollectionSamples

	| sentence |
	sentence := 'the quick brown fox slyly jumped over 1029384756 lazy dogs.'.
	^Array
		with: SortedCollection new
		with: sentence asSortedCollection
		with: (
			(SortedCollection sortBlock: [ :a :b | a > b ])
				addAll: sentence substrings;
				addAll: sentence asUppercase substrings;
				yourself)
