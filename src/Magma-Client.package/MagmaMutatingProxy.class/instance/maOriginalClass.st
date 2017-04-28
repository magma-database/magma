accessing
maOriginalClass
	"This is called by maSelectPreMadeObjectBufferFrom:, so overriding for speed, to avoid having to go through DNU."
	^ self realObjectIfMutatingProxy maOriginalClass