private accessing
allNonCollectionSamples

	allNonCollectionSamples
		ifNil:
			[ allNonCollectionSamples := OrderedCollection new.
			self nonCollectionSamplesDo:
				[ : eachSelector : eachSamples |
				allNonCollectionSamples addAll: eachSamples ] ].
	^ allNonCollectionSamples