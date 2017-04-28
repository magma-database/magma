initialize-release
initialize
	super initialize.
	transactionLog := MaTransactionLog new.
	largeCollectionManagers := Dictionary new.
	sessions := Dictionary new.
	commitGuard := Mutex new.
	flushGuard := Mutex new.
	filePool := MaFileStreamPool maxSize: 60.
	wantsToClose := false