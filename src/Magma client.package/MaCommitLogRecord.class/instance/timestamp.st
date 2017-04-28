accessing
timestamp
	"By storing the timestamp we can restore to a paritcular point-in-time."
	^ DateAndTime fromSeconds: 
		(byteArray 
			maUint: 40
			at: self bufferPositionOfTimestamp)	"DateAndTime fromSeconds: (2 raisedTo: 40)"