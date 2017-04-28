accessing
commitPackageCountByClass
	^ (commitPackage objects asArray collect: [ : each | each maOriginalClass ]) asBag sortedCounts