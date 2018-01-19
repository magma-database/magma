private accessing
indexFileNameForKeySize: keySize recordSize: recordSize

	| localName |
	
	localName := 'k', keySize printString, 'r', recordSize printString, '.', MaHashIndex suggestedFileExtension.
	^ self environmentDirectory / localName.