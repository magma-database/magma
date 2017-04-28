*ma base additions
maPackages
	^ (self allPackages select: 
		[ : each | 
		(each packageName 
			maBeginsWith: 'Ma'
			caseSensitive: true) or: 
			[ {  'WriteBarrier'. 'Collections-BTree'  } anySatisfy: [ : eachAlt | eachAlt = each packageName ] ] ]) collect: [ : each | PackageInfo named: each packageName ]