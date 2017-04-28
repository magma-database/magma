accessing
globalObject
	^ aliases 
		maDetect: [ : each | Smalltalk hasClassNamed: each ]
		ifFound: [ : found | Smalltalk classNamed: found ]
		ifNone: [ super globalObject ]