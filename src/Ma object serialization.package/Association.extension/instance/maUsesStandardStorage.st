*ma object serialization
maUsesStandardStorage

	^ (Smalltalk associationAt: key ifAbsent: [nil]) ~~ self