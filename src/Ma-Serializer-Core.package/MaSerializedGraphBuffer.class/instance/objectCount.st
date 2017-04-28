accessing
objectCount

	| count |
	count := 0.
	self buffersDo: [ : each | count := count + 1 ].
	^ count