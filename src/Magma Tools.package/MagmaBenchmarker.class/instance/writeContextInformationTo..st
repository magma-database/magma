capture context
writeContextInformationTo: aStream 
	aStream nextPutAll: 'The date is '.
	DateAndTime now printOn: aStream.
	self
		writeHardwareInformationTo: aStream ;
		writePlatformInformationTo: aStream ;
		writeVmInformationTo: aStream ;
		writeImageInformationTo: aStream ;
		writePackageInformationTo: aStream ;
		writeServerInformationTo: aStream ;
		writeClientSessionInformationTo: aStream ;
		writeBenchmarkerInformationTo: aStream