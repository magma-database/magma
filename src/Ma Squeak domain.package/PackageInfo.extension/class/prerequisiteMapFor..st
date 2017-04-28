*ma squeak domain
prerequisiteMapFor: aCollection 
	"Answer a Dictionary whose keys are each PackageInfo in aCollection, the values are an OrderedCollection of the prerequisite packages (PackageInfos whose dependentPackageInfos include the key)."
	| answer |
	answer := Dictionary new.
	'Calculating prerequisite-map...' 
		displayProgressFrom: 1
		to: aCollection size
		during: 
			[ : bar | 
			aCollection withIndexDo: 
				[ : each : x | 
				bar value: x.
				each dependentPackageInfos do: 
					[ : eachDependent | 
					(answer 
						at: eachDependent
						ifAbsentPut: [ OrderedCollection new ]) add: each ] ] ].
	^ answer