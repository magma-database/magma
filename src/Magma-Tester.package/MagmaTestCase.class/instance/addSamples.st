test objects
addSamples
	clientSession commit: 
		[ clientSession root 
			at: 'samples'
			put: MaFixtureFactory new samples ].
	"Test that all kinds of the samples can withstand the potential refresh or not."
	clientSession abort