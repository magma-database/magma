*magma client
findMcModel
	"Find my WorkingCopy, use the first mcModel-capable repository in its reposigoryGroup."
	self repositoryGroup repositoriesDo:
		[ : each | each mcModel ifNotNilDo:
			[ : mcModel | ^ mcModel ] ].
	^ nil