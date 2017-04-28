private
proxyFor: oid 
	| proxy |
	self
		oidOf: (proxy := createProxyBlock value: oid)
		is: oid.
	^ proxy