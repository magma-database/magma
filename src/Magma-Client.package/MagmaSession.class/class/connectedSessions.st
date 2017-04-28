accessing
connectedSessions
	"The MagmaSessions in this image, connected to some repository."
	^ ConnectedSessions asArray sort: [ : a : b | a printString < b printString ]