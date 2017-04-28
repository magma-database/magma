initializing
initialize
	super initialize.
	bpMapIndex := 0.	"0-based index"
	preferences := MaObjectSerializerPreferences new.
	self
		oidManager: MaOidManager new ;
		classIdManager: MaClassIdManager new ;
		initializeTraversalStrategy ;
		toCreateProxies: 
			[ : oid | 
			MaObjectSerializationUserError signal: 'No createProxyBlock specified.  See MaObjectSerializer>>toCreateProxies:' ].
	self graphBuffer: (MaSerializedGraphBuffer new: 50).
	self initializePreMadeObjectBuffers.
	self beBored.
	truncatedObjects := MaObjectSerializerPreferences newWeakIdentityKeyDictionary.	"want a WeakIdentitySet.."
	self setUpPreAndPostProcessing