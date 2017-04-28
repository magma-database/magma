private accessing
indexFileNameForKeySize: keySize recordSize: recordSize

	^ self environmentDirectory fullNameFor: 'k', keySize printString, 'r', recordSize printString, '.', MaHashIndex suggestedFileExtension