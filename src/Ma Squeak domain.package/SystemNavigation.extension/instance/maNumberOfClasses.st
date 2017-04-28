*ma squeak domain
maNumberOfClasses
	| count |
	count := 0.
	self allClassesDo: [ : e | count := count + 1 ].
	^ count