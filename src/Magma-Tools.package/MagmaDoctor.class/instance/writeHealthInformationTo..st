accessing
writeHealthInformationTo: aWriteStream
	self
		printTitleOn: aWriteStream ;
		printPrimitiveAttributesOn: aWriteStream ;
		printCrucialBuffersOn: aWriteStream