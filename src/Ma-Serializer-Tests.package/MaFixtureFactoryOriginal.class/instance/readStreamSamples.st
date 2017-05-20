private non-collection samples
readStreamSamples

	^Array
		with: (ReadStream on: (1 to: 1000));
		with: (ReadStream on: #('chris' 'paula'))
