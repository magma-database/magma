copying
postTrimmedCopy
	super postTrimmedCopy.
	connection := connection trimmedCopy.
	toBeRefreshed := nil