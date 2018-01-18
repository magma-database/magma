private
postCopyWithNewBuffer

	graphBuffer := MaSerializedGraphBuffer new: 1000.
	self
		initializePreMadeObjectBuffers;
		resetByteArray;
		beBored