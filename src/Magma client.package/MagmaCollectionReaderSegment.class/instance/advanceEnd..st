private
advanceEnd: count 
	endIndex := endIndex + count.
	mergedCount := mergedCount + count.
	self advanceLastKnownSize: count