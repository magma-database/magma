actions
refresh: aMagmaSession includingLocal: aBoolean 
	aMagmaSession assignPermanentOidsFrom: permanentOids.
	super
		refresh: aMagmaSession
		includingLocal: aBoolean.
	aMagmaSession
		 recordObjects: newObjectBuffers ;
		 recordObjects: changedObjectBuffers