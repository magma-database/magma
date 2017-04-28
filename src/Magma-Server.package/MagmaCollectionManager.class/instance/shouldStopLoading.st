testing
shouldStopLoading
	^ repository wantsToClose or: [ self wantsReleased ]