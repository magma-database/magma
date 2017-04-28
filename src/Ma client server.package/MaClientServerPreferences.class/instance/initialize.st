initialize-release
initialize
	super initialize.
	compressThreshold := MaSerializedGraphBuffer unreasonablePhysicalSize * 2.
	timeoutSeconds := 10