accessing
stopLoading
	self session ifNotNil:
		[ : sess | sess stopLoading: self ]