private
generateTemporaryDeclarations
	"Write the temps declaration."
	stream
		 cr ;
		 tab ;
		 nextPut: $| ;
		 space.
	fields do:
		[ : i | stream
			 space ;
			 nextPut: $t ;
			 nextPutAll: i asString ].
	stream nextPutAll: ' returnValue |'