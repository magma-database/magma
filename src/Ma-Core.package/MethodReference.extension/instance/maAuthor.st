*ma-core
maAuthor
	"Answer the author initials of the current version of this method."
	^ self maActualMethod ifNotNil: 
		[ : cm | 
		cm timeStamp subStrings ifNotEmptyDo: [ : strings | strings first ] ]