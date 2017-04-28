private
fullFileNameStringFor: keysOrOids of: aMagmaIndexDescription 
	^ repository directory fullNameFor: 
		(self 
			filenameFor: keysOrOids
			of: aMagmaIndexDescription)