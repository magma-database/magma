recovery
unapplyUsing: aMaApplyRecord
	"Reapply the contents of aMaBeforeImageRecord to the file it came from."

	aMaApplyRecord fileId
		caseOf:
			{ [ MaApplyRecord objectsFileId ] -> [ self unapplyObjectsFileUsing: aMaApplyRecord ].
			[ MaApplyRecord filePositionsFileId ] -> [ self unapplyFilePositionsFileUsing: aMaApplyRecord ] }
		otherwise:
			[ MagmaSoftwareError signal: 'unknown fileId' ]