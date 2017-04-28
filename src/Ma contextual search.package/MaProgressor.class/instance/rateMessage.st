accessing
rateMessage
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: self ratePerMinute ;
			maPrint: ' / minute in ' ;
			maPrint: stopwatch duration ]