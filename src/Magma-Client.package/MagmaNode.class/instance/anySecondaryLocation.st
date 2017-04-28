accessing
anySecondaryLocation
	"Answer one of my warm backup locations at random.  Some installations may have multiple warm backups equally accessible, so clients don't care which one they connect to.  This method provides those applications convenience of not having to specify one of the warm backups explicitly, although they can (#see secondaryLocation:)"
	^ self secondaryLocations atRandom