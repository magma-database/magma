notifications
noteServerShutdown
	super noteServerShutdown.
	controller close.
	self note: controller printString , ' closed.'