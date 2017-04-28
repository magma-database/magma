*magma-server
refreshIfCountersOrStat: aMaObjectBuffer using: aMaObjectRepository 
	(aMaObjectBuffer classId = MagmaClassIdManager magmaCounterClassId or: [ aMaObjectRepository filer magmaStatClassIds includes: aMaObjectBuffer classId ]) ifTrue:
		[ result toBeRefreshed
			at: aMaObjectBuffer oid
			put: aMaObjectBuffer copyWithSameBuffer ]