*magma-tester
maRecursiveRemove
	self allSubclassesDo: [ : each | each maRecursiveRemove ].
	self removeFromSystem: false