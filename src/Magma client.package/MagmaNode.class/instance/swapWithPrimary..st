updating
swapWithPrimary: secondaryLocation 
	(self secondaryLocations includes: secondaryLocation) ifFalse: 
		[ MagmaUserError signal: 'Swap function only available with warm-backups.' ].
	locations 
		swap: 1
		with: (locations indexOf: secondaryLocation)