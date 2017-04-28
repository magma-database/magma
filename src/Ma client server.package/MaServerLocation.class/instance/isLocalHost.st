testing
isLocalHost
	^ (self host beginsWith: '127') or: 
		[ { 
			'localhost'.
			(NetNameResolver localHostName).
			(NetNameResolver localAddressString)
		 } includes: self host ]