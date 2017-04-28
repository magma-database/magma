signaling
signalRefresh
	self
		signal: 'refreshing repository view'
		do: [ : session | session refresh ]