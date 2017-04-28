access
buffersInCommit: commitNumber 
	"The MaCommitLogEntry that contained this buffer."
	^ (session commitPackageAt: commitNumber) ifNotNilDo: 
		[ : cp | 
		| answer |
		answer := OrderedCollection new.
		cp objectsDo: 
			[ : eachBuffer | 
			answer add:
				(MagmaBufferFacade
					buffer: eachBuffer copyWithSameBuffer
					controller: self) ].
		answer ]