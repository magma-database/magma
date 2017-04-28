private
generateCheckField: fieldNumber 
	"Compare the fieldNumber'th instVar of the receiver to the temp-var it was stored in and send #modified: if they're not identical."
	stream
		 cr ;
		 tab ;
		 nextPut: $t ;
		 nextPutAll: fieldNumber asString ;
		 nextPutAll: ' == (' ;
		 nextPutAll: (class allInstVarNames at: fieldNumber) ;
		 nextPutAll: ') ifFalse: [ self writeBarrier modified: self. ^returnValue ].'