private
generateStoreField: fieldNumber 
	"Store the fieldNumber'th instVar into a temp-var for that field."
	stream
		 cr ; tab ;
		 nextPut: $t ;
		 nextPutAll: fieldNumber asString ;
		 nextPutAll: ' := ' ;
		 nextPutAll: (class allInstVarNames at: fieldNumber) ;
		 nextPut: $.