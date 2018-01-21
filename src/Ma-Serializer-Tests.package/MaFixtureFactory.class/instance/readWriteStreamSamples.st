private non-collection samples
readWriteStreamSamples

	^Array
		with: (ReadWriteStream on: (1 to: 1000));
		with: (ReadWriteStream on: #('chris' 'paula'))
