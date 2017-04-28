*ma-core
isInMagma
	^ (self respondsTo: #magmaSession) and: [ self magmaSession notNil ]