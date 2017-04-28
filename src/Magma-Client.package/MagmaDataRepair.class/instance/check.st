actions
check
	"Answer a boolean whether there is any data needing repair."
	| found |
	mode := #check.
	MagmaRepairNotification signal: 'Repair mode:  #check.'.
	found := self anyDataToRepair.
	MagmaRepairNotification signal:
		(found
			ifTrue: [ 'Found data in need of repair.' ]
			ifFalse: [ 'All data found clean, no data to repair.' ]).
	^ found