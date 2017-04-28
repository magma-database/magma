accessing
allClientInstances
	^ self allSubInstances reject: [ : each | each isServerSession ]