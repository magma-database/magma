test objects
addSamples
	| samples |
	samples := MaFixtureFactory new samples.
	clientSession commit: 
		[ clientSession root 
			at: 'samples'
			put: samples ].
	"Test that all kinds of the samples can withstand the potential refresh or not."
	clientSession abort