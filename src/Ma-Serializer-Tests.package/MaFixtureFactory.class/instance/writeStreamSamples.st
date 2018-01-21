rm
writeStreamSamples

	^Array
		with: (WriteStream on: String new);
		with: (WriteStream on: (OrderedCollection new: 200))
