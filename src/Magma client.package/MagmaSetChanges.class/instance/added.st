accessing
added
	"On the client, answers an Dictionary whose key is the object to be added, value is a collection of its calculated hashIndex values.  On the server, the key is the oid of the object, not the object itself."

	^ changes
		at: #added
		ifAbsentPut: [ Dictionary new ]