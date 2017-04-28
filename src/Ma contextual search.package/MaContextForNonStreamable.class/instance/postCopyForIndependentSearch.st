copying
postCopyForIndependentSearch
	super postCopyForIndependentSearch.
	self initializeQueue.
	queueingProcess := nil.
	doneQueueing := false