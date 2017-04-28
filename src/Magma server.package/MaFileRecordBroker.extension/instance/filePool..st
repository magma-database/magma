*magma server
filePool: aMaFileStreamPool 
	file maIsTransactional ifTrue: [ file pool: aMaFileStreamPool ]