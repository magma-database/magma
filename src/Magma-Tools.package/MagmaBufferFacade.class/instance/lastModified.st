access
lastModified
	"The DateAndTime of the server the time this object was last committed."
	^ self commitRecord ifNotNilDo: [ : cr | cr timestamp ]