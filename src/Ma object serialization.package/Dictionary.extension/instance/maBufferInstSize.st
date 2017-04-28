*ma object serialization
maBufferInstSize
	^ (self size * 2) + "enough for other named instVars" self maInstSize - 2 "except tally and array"