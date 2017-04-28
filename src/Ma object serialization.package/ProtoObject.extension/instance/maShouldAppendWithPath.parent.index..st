*ma object serialization
maShouldAppendWithPath: path parent: parent index: indexInteger
	^ parent isNil
	or:
		[ self maRequiresOwnBuffer
		and: [ (parent maIsTransient: indexInteger) not ] ]