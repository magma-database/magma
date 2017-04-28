*ma-serializer-core
maUsesStandardStorage 

	^ (self hasSubject and: [ self subject isKindOf: Class ]) not