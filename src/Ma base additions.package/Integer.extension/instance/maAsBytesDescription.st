*ma base additions
maAsBytesDescription
	| suffixes |
	suffixes := { 'k'"ilobytes". 'M'"egabytes". 'G'"igabytes". 'T'"erabytes". 'P'"etabytes". 'E'"xabytes". 'Z'"ettabytes". 'Y'"ottabytes"}.
	suffixes size to: 1 by: -1 do:
		[ : index |  | units |
		units := 1000 raisedTo: index.
		self > units ifTrue: [ ^ ((self / units) asFloat roundTo: 0.01) asString, (suffixes at: index) ] ].
	^ self asString