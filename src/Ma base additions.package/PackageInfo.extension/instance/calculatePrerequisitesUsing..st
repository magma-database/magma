*ma base additions
calculatePrerequisitesUsing: interestingPackages 
	"Prerequisite calculation takes so long it is calculated separately by the developer, and then the #prerequisitePackageNames is manually overridden."
	| map |
	map := self class prerequisiteMapFor: interestingPackages.
	^ self calculatePrerequisitesUsingMap: map