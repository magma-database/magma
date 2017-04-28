historys
requestProcessingTimeHistoryFor: requestObject 
	"Different requests take different amounts of time to process.  Track them by the class of request."
	^ requestProcessingTimeHistorys 
		at: requestObject maOriginalClass
		ifAbsentPut: 
			[ MaStatHistory new
				name: 'Time to process ' , requestObject class name ;
				transition ;
				yourself ]