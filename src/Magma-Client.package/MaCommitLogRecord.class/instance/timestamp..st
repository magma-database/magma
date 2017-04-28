accessing
timestamp: aDateAndTime
	"By storing the timestamp we can restore to a paritcular point-in-time."
	^ byteArray 
		maUint: 40  "DateAndTime fromSeconds: (2 raisedTo: 40)"
		at: self bufferPositionOfTimestamp
		put: aDateAndTime asSeconds