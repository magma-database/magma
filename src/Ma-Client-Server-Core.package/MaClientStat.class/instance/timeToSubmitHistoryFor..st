historys
timeToSubmitHistoryFor: requestClass 
	"The total time, by request class, including serialization, materialization, and all other house keeping.  A useful set of stats measuring the total reality for the client, by request type."
	^ timeToSubmitByRequestClassHistorys 
		at: requestClass
		ifAbsentPut: 
			[ MaStatHistory new
				name: 'Time waiting for ' , requestClass name , ' requests' ;
				transition ;
				yourself ]