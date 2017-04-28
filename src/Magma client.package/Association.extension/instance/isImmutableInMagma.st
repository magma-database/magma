*magma client
isImmutableInMagma
	"Magma does not track changes to globals.  Therefore, if I am one of the entries in the Smalltalk global dictionary, I am immutable, otherwise I'm not."

	^ self maUsesStandardStorage not