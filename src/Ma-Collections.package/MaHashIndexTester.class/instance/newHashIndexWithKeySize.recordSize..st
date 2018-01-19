private creation
newHashIndexWithKeySize: keySize recordSize: recordSize
	| filename |
	self notify: 'creating ',
		(filename := self
			indexFileNameForKeySize: keySize
			recordSize: recordSize) pathString, '..'.
	self deleteFiles: { filename }.
	^ MaHashIndex
		createNamed: filename
		keySize: keySize
		valueSize: 48 "MaObjectBuffer oidSize"
		recordSize: recordSize
