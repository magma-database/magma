initialize-release
addNewIndex: aMagmaIndexDescription 
	oidIndexes add: (oidIndexesByAttribute 
			at: aMagmaIndexDescription attribute
			put: (MaHashIndex 
					create: (
						(MaAtomicFileStream fileNamed: (self 
								fullFileNameStringFor: 'oids'
								of: aMagmaIndexDescription))
							pool: repository filePool ;
							yourself)
					keySize: aMagmaIndexDescription keySize
					valueSize: MaObjectBuffer oidSize
					recordSize: aMagmaIndexDescription recordSize)).
	keyIndexes add: (keyIndexesByAttribute 
			at: aMagmaIndexDescription attribute
			put: (MaHashIndex 
					create: (
						(MaAtomicFileStream fileNamed: (self 
								fullFileNameStringFor: 'keys'
								of: aMagmaIndexDescription))
							pool: repository filePool ;
							yourself)
					keySize: MaObjectBuffer oidSize
					valueSize: aMagmaIndexDescription keySize
					recordSize: aMagmaIndexDescription recordSize))