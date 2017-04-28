private
forceClean
	guard critical:
		[ lastClean := 0.
		self cleanIfTime ]