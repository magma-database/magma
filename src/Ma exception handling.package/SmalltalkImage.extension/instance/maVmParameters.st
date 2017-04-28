*ma exception handling
maVmParameters
	| answer |
	answer := OrderedCollection new.
	self maVmParametersDo: [ : each | answer add: each ].
	^ answer