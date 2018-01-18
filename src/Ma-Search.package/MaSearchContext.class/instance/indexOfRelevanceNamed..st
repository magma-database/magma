private
indexOfRelevanceNamed: aString

	^ self relevanceNames 
		indexOf: aString
		ifAbsent:
			[ MaUserError signal:
				(String streamContents:
					[ : stream |
					stream
						nextPutAll: aString ;
						nextPutAll: ' is not valid.  Must use any of '.
					self relevanceNames do:
						[ : each |
						stream
							nextPutAll: each ;
							space ] ]) ]