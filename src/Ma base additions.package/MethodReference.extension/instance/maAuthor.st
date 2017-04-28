*ma base additions
maAuthor
	"Answer the author initials of the current version of this method."
	^ self maActualMethod ifNotNilDo: 
		[ : cm | 
		cm timeStamp subStrings ifNotEmptyDo: [ : strings | strings first ] ]