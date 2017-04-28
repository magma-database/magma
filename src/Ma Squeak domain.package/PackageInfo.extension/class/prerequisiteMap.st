*ma squeak domain
prerequisiteMap
	"Answer a Dictionary whose keys are each PackageInfo in the system, the values are an OrderedCollection of the prerequisite packages (PackageInfos whose dependentPackageInfos include the key)."
	| answer |
	answer := Dictionary new.
	self allPackages do: 
		[ : each | 
		each dependentPackageInfos do: 
			[ : eachDependent | 
			(answer 
				at: eachDependent
				ifAbsentPut: [ OrderedCollection new ]) add: each ] ]