*ma base additions
isInMagma
	^ (self respondsTo: #magmaSession) and: [ self magmaSession notNil ]