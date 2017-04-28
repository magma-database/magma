*ma-core
dependentPackageInfos
	| answer |
	answer := Set new.
	self externalUsers do: [ : each | each key packageInfo ifNotNilDo: [ : pi | answer add: pi ] ].
	self externalSubclasses do: [ : each | each packageInfo ifNotNilDo: [ : pi | answer add: pi ] ].
	^ answer asArray