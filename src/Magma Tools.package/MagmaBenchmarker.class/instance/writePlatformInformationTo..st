capture context
writePlatformInformationTo: aStream 
	aStream
		cr ;
		cr ;
		nextPutAll: 'OS Details:'.
	#(#osVersion #platformName #platformSubtype ) do: 
		[ : each | 
		self 
			writeEntry: each
			value: (SmalltalkImage current perform: each)
			to: aStream ]