private-report generation
printRepositoryPathOn: aWriteStream 
	aWriteStream
		cr ;
		maPrint: 'pathName:  ' ;
		maPrint: self pathName