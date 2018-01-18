initializing
initialize
	super initialize.
	bpMapIndex := 0. "0-based index"
	preferences := MaObjectSerializerPreferences new.
	self
		 oidManager: MaOidManager new ;
		 classIdManager: MaClassIdManager new ;
		 initializeTraversalStrategy ;
		 toCreateProxies:
			[ : oid | MaObjectSerializationUserError signal: 'No createProxyBlock specified.  See MaObjectSerializer>>toCreateProxies:' ]; 
		graphBuffer: (MaSerializedGraphBuffer new: 50) ;
		 initializePreMadeObjectBuffers ;
		 beBored ;
		 setUpPreAndPostProcessing