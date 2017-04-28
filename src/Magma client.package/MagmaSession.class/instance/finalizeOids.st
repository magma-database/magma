private
finalizeOids
	guard critical: 
		[ serializer finalizeOids.
		transaction finalizeOids.
		self resetLastClean ]