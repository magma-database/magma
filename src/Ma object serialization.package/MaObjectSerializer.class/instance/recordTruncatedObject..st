building
recordTruncatedObject: anObject
	"A truncated object is one that has been read, but the in-image definition did not have a place for one of its inst vars.  This is useful for then detecting if the user tries to write that object back out to warn him that he will lose data.  See also isTruncated:."

	truncatedObjects at: anObject put: nil