*ma-core
maPackages
	^ (self allPackages select: 
		[ : each | 
		(each packageName 
			maBeginsWith: 'Ma'
			caseSensitive: true) or: 
			[ {  'WriteBarrier' } anySatisfy: [ : eachAlt | eachAlt = each packageName ] ] ]) collect: [ : each | PackageInfo named: each packageName ]