private actions
run: selectorSymbol keySize: keySize recordSize: recordSize 
	self notify: 
		(String streamContents: 
			[ : stream | 
			stream
				nextPutAll: 'keysize ' ;
				maPrint: keySize ;
				nextPutAll: ' record size ' ;
				maPrint: recordSize ;
				nextPutAll: ' completed in ' ;
				nextPutAll: [ self perform: selectorSymbol ] durationToRun printString ])