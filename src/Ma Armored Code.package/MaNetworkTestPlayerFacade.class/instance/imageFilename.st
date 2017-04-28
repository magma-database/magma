access
imageFilename
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: $_ ;
			maPrint: testCaseClass suiteName ;
			maPrint: 'Test' ;
			maPrint: self name ]