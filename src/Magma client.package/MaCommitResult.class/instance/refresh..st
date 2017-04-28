actions
refresh: aMagmaSession

	aMagmaSession assignPermanentOidsFrom: permanentOids.
	super refresh: aMagmaSession.
	aMagmaSession
		recordObjects: newObjectBuffers ;
		recordObjects: changedObjectBuffers