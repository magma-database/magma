*magma-client
isImmutableInMagma
	"If I am one of the special global constant Array's, I am immutable, otherwise I'm not."

	^ self maUsesStandardStorage not