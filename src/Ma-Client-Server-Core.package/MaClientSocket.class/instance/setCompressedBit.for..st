private
setCompressedBit: aBoolean for: headerInteger 
	^ aBoolean 
		ifTrue: 
			[ "Below is the correct implementation, but we would need a 2GB ByteArray for the simpler faster implementation below not to work.  2GB can't happen."
			"ba maUint: 32 at: 0 put: ((ba maUint: 32 at: 0) maBitSet: 32)."
			headerInteger maBitSet: 32 ]
		ifFalse: [ headerInteger maBitClear: 32 ]