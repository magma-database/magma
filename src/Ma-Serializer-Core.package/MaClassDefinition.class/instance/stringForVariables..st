private
stringForVariables: aCollection

	^ String streamContents:
		[ :stream |
		aCollection
			do: [ :ea | stream nextPutAll: ea ]
			separatedBy: [ stream space ] ]