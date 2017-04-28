private
anyDataToRepair
	doBlock := [ : each | ^ true ].
	self enumerateCheckAndDo.
	^ false