copying
postTrimmedCopy
	| withBuffers |
	super postTrimmedCopy.
	changedObjectBuffers := nil.
	withBuffers := newObjectBuffers.
	newObjectBuffers := withBuffers class new: withBuffers size.
	withBuffers keysAndValuesDo: 
		[ : eachOid : eachObject | 
		newObjectBuffers 
			at: eachOid
			put: nil ]