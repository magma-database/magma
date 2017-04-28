private collection samples
arraySamples

	| populatedArray |

	populatedArray := self allNonCollectionSamples asArray.
	^Array
		with: Array new
		with: (Array new: 100)
		with: populatedArray
