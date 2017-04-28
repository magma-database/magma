*ma base additions
dependentPackageInfos
	| answer |
	answer := Set new.
	self externalUsers do: [ : each | each key maPackageInfo ifNotNilDo: [ : pi | answer add: pi ] ].
	self externalSubclasses do: [ : each | each maPackageInfo ifNotNilDo: [ : pi | answer add: pi ] ].
	^ answer asArray