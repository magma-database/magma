private
allCoresFinished
	^ guard critical: [ cores allSatisfy: [ : each | each isNil ] ]