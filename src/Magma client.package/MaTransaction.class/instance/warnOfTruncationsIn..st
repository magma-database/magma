private
warnOfTruncationsIn: aCollection 
	aCollection isEmptyOrNil 
		ifFalse: 
			[MagmaTruncationWarning 
				signal: (String streamContents: 
							[:stream | 
							stream nextPutAll: 'Your definition of '.
							(aCollection collect: [:each | each maOriginalClass name]) asSet do: 
									[:each | 
									stream
										nextPutAll: each;
										nextPutAll: ', '].
							stream 
								nextPutAll: 'are missing instance variables present in the repository-version.  If you proceed with this commit, information in one or more of these instances will be lost.'])]