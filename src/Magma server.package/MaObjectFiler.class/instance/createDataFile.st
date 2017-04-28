private
createDataFile
	(directory fileExists: self class objectsPhysicalFilename) ifTrue: 
		[ MagmaEnvironmentError signal: directory pathName , ' already exists.' ].
	self openObjectsFile.
	"Write some extra blank space to allow for possible future fields."
	file 
		maWrite: self class sizeOfEmptyRepository
		bytesFromPosition: 1
		of: (ByteArray new: self class sizeOfEmptyRepository)
		atFilePosition: 0; 
		maCommit.
	self
		restoreMode: false ;
		classDefinitionsOid: MaOidCalculator oidForNil ;
		definitionOid: MaOidCalculator oidForNil ;
		signature: MaObjectRepository recognitionSignature ;
		version: MagmaSession magmaVersion ;
		commitNumber: 0 ;
		initializeBranchCode 