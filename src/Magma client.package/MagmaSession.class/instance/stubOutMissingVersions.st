private
stubOutMissingVersions
	"Stub out the missingVersions of my mcModel, if present."
	self mcModel ifNotNilDo:
		[ : mcModel | self stubOut: mcModel missingVersions ]