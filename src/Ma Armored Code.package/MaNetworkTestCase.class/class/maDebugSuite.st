private
maDebugSuite
	"Kickoff each subclass, #maDebug.."
	self withAllSubclassesDo: [ : each | each suite maDebug ]