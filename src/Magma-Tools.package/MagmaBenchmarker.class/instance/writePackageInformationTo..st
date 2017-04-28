capture context
writePackageInformationTo: aStream 
	| workingCopy versionInformation |
	aStream
		cr ;
		cr ;
		nextPutAll: 'Code Package Details (from Monticello):'.
	self magmaPackageListDo: 
		[ : each | 
		workingCopy := (MCPackage named: each) workingCopy.
		versionInformation := workingCopy ancestors first.
		aStream
			cr ;
			cr ;
			nextPutAll: versionInformation summaryHeader.
		workingCopy needsSaving ifTrue: 
			[ aStream
				cr ;
				tab ;
				nextPutAll: '** modified **' ] ]