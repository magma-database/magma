private
isTimeToClean
	^ guard critical:
		[ (cleaningProcess isNil or: [ cleaningProcess isTerminated ]) and:
			[ (Time millisecondsSince: lastClean) > 60000 and:
				[ proxies size > 1000 or: [ (Time millisecondsSince: lastClean) > (1000 * 60 * 5) ] ] ] ]