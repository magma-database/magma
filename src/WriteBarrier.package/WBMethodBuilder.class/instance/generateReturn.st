private
generateReturn
	"Return the temp-var which holds the value of the call to super."
	stream
		 cr ;
		 tab ;
		 nextPutAll: '^returnValue'