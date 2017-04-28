*ma object serialization
maUsesStandardStorage 

	^ (self hasSubject and: [ self subject isKindOf: Class ]) not