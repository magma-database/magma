accessing
rateMessage
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: self ratePerMinute asInteger asBytesDescription ;
			maPrint: ' / minute in ' ;
			maPrint: stopwatch duration ]