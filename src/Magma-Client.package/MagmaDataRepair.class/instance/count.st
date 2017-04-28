actions
count
	"Answer the number of objects needing repair."
	mode := #count.
	MagmaRepairNotification signal: 'Repair mode:  #count.'.
	self
		 enumerateCheckAndDo ;
		 signalCount.
	^ count