filestream api
closed
	"Answer whether I have a file-handle allocated from the operating system."
	^ self isPhysical not or: 
		[ self isPhysical and: [ fileStreams allSatisfy: [ : each | each closed ] ] ]