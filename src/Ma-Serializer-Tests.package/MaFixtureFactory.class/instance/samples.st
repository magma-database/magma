creation
samples
	| samples |

	samples := Dictionary new.
	self nonCollectionSamplesDo:
		[ : eachSelector : eachSamples |
		samples
			at: eachSelector
			put: eachSamples ].
	self collectionSamplesDo:
		[ : eachSelector : eachSamples |
		samples
			at: eachSelector
			put: eachSamples ].
	^ samples