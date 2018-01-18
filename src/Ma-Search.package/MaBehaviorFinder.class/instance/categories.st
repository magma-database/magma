categories
categories
	"The category names of my methods."
	^ categories ifNil: 
		[ categories := Set new.
		self methods do: [ : each | each category ifNotNilDo: [ : cat | categories add: cat ] ].
		categories := categories asSortedCollection ]