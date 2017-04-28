access
buffersInSameCommit
	"All the buffers in my commitPackage."
	^ self commitPackage ifNotNilDo: 
		[ : cp | 
		| answer |
		answer := OrderedCollection new.
		cp objectsDo: 
			[ : eachBuffer | 
			answer add: (self class 
					buffer: eachBuffer copyWithSameBuffer
					controller: controller) ].
		answer ]