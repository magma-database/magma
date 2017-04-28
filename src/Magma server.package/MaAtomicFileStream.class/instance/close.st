filestream api
close
	self isPhysical ifTrue: 
		[ self maCommit.
		fileStreams copy withIndexDo: 
			[ : each : x | 
			pool close: each.
			"We're going in order, so removeFirst works."
			fileStreams removeFirst.
			sizes removeFirst ] ]