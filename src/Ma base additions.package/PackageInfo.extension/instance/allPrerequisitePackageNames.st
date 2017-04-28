*ma base additions
allPrerequisitePackageNames
	"My immediate prerequistes and their prerequisites, all the way down."
	"Yuck!  DependencyBrowser needs to decouple its domain behavior from the UI!!"
	^ (DependencyBrowser new computePackageDependencies: self packageName) packageDeps asOrderedCollection