*magma-client
cachedObjectsDo: aBlock
	"Enumerate all objects which are materialized in memory."
	oidManager objectsDo: aBlock