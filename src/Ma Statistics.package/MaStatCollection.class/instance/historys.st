accessing
historys
	| answer |
	answer := OrderedCollection new.
	self historysDo: [ : each | answer add: each ].
	^ answer