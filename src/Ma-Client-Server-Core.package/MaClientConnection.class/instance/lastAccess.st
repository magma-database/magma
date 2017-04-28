accessing
lastAccess
	"The millisecondClockValue of the last time a request was processed for this client.  However, when it is requested by another client, because the millisecondClockValue is different across all computers, this variable is converted to the NUMBER of milliseconds since the last access."
	^ lastAccess