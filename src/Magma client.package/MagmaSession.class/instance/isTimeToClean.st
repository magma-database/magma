private
isTimeToClean
	^ (Time millisecondsSince: lastClean) > 90000