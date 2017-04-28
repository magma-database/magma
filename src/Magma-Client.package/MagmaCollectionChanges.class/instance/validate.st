testing
validate
	self additionsDo: 
		[ : eachObject : indexHashes | 
		(indexHashes anySatisfy: [ : eachArr | eachArr anySatisfy: [ : eachHash | eachHash < 0 ] ]) ifTrue: 
			[ MagmaUserError signal: indexHashes asString , ' is not a valid index hash (may not be negative).' ] ]