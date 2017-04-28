accessing
timestamp
	"By storing the timestamp we can restore to a paritcular point-in-time."
	^ DateAndTime fromSeconds: 
		(byteArray maUnsigned40At: self bufferPositionOfTimestamp+1)	"DateAndTime fromSeconds: (2 raisedTo: 40)"