private non-collection samples
writeStreamSamples

	^Array
		with: (WriteStream on: String new);
		with: (WriteStream on: (OrderedCollection new: 200))
