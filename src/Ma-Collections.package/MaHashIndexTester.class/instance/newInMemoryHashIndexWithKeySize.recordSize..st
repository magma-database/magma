private creation
newInMemoryHashIndexWithKeySize: keySize recordSize: recordSize 
	self notify: 'creating in-memory with keySize: ' , keySize printString , ' recordSize: ' , recordSize printString , '.'.
	^ MaHashIndex 
		newWithKeySize: keySize
		valueSize: 48 "MaObjectBuffer oidSize"
		recordSize: recordSize	