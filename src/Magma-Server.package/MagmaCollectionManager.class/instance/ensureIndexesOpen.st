initialize-release
ensureIndexesOpen
	collection descriptionsDo: 
		[ : each | 
		(self hasIndexFor: each attribute) ifFalse: 
			[ oidIndexes add: 
				(oidIndexesByAttribute 
					at: each attribute
					put: 
						(self openIndex: 
							(self 
								fullFileNameStringFor: 'oids'
								of: each))).
			keyIndexes add: 
				(keyIndexesByAttribute 
					at: each attribute
					put: 
						(self openIndex: 
							(self 
								fullFileNameStringFor: 'keys'
								of: each))) ] ]