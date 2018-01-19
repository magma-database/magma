private
stubOutMissingVersions
	"Stub out the missingVersions of my mcModel, if present."
	self mcModel ifNotNil:
		[ : mcModel | self stubOut: mcModel missingVersions ]