high-availability
allowFailover: aBoolean 
	"Set whether this session should talk to any and all nodes to ensure service is provided by multiple servers, improving system performance and continuity."
	self isLocal ifTrue: 
		[ MagmaUserError signal: 'Only applicable to multiserver on-line nodes.' ].
	guard critical: 
		[ allowFailover := aBoolean.
		self ensureSecondaryLinkConfigured ]