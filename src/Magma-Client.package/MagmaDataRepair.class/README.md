A MaDataRepair is used to perform data repairs on Magma models in a controlled and reliable fashion.  The requirements of a data-repair are:

	- identify and report all data which will be evaluated so it can known that no objects were skipped simply due to them not being evaluated.
	- identify and report what objects are in need of repair.
	- repair broken data objects.
	- verify and report whether data is fixed.

Example:

(MagmaDataRepair
	at: (MagmaRemoteLocation host: 'prod1' port: 51199)
	enumerate: [ : session : repair | session root accountsDo: [ : eachAccount | eachAccount isThirdParty ifTrue: [ repair check: eachAccount] ] ]
	check: [ : eachAccount : repair | eachAccount importFilters anySatisfy: [ : each | each maOriginalClass = MaxImportFilter ] ])
	repair: [ : eachAccount : repair | eachAccount importFilters withIndexDo: [ : eachFilter : index | eachAccount importFilters at: index put: eachFilter asKeywordFilter ] ]