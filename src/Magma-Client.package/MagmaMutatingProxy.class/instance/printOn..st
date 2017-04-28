printing
printOn: aStream 
	MagmaPreferences debugProxies 
		ifTrue: 
			[ super printOn: aStream.
			aStream
				maPrint: $( ;
				maPrint: oid ;
				maPrint: '/' ;
				maPrint: session id ;
				maPrint: ')' ]
		ifFalse: [ self realObjectIfMutatingProxy printOn: aStream ]