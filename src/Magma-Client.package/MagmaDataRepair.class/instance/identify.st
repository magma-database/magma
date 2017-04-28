actions
identify
	| badData |
	mode := #identify.
	badData := OrderedCollection new.
	doBlock := [ : badObject | badData add: badObject ].
	MagmaRepairNotification signal: 'Repair mode:  #identify'.
	self enumerateCheckAndDo.
"	badData do: [ : each | MagmaRepairNotification signal: 'Found needing repair: ', each asString ]."
	self signalCount.
	^ badData