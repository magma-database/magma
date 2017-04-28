copying
copyFrom: startIndex to: endIndex

	^ (startIndex to: endIndex) collect: [ :i | self at: i ]