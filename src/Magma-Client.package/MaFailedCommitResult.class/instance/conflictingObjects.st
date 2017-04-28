accessing
conflictingObjects
	"Answer a collection of Associations whose keys are the persistent database object (updated) and whose values are a shallowCopy of that object with the local changes."
	^ Array streamContents:
		[ : stream | self conflictingObjectsDo:
			[ : each | stream nextPut: each ] ]