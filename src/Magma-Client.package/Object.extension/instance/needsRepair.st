*magma-client
needsRepair
	"Generic implementation of a #needsRepair.  If proper convention of signaling a MagmaRepairNotification every time a piece of bad data is found, then no MagmaDataRepair's should need to specify any check block other than 'each needsRepair'."
	[ self repair ]
		on: MagmaRepairNotification
		do:
			[ : noti | "Let the repair notification be printed to the log."
			MagmaRepairNotification signal: noti messageText.
			^ true ].
	^ false