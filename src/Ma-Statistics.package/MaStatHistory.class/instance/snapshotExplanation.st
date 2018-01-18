accessing
snapshotExplanation
	^ String streamContents: 
		[ : stream | 
		stream
			maPrint: 'Each ' ;
			maPrint: snapshotInterval increment ;
			maPrint: '-minute period for the last ' ;
			maPrint: snapshotInterval size ;
			maPrint: ' minutes' ]