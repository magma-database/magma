private
noteNewSpan: aTimespan 
	super noteNewSpan: aTimespan.
	startTime := aTimespan start.
	stopTime := aTimespan end