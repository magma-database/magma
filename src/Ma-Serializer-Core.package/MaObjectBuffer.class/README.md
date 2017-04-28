This class encapsulates a single object into its byteArray.  The 0-based buffer positions of my fields are:

	0 = oid (6 bytes)
	6 = physicalSize (4 bytes)
	10 = control-fields2 (1 byte)
		bit 1 = 
			For MethodContextBuffers, 0 if small-frame, 1 = largeFrame.
			For CompiledMethodBuffers, 0 = Cog header, 1 = spurHeader.
	11 = filler (2 bytes)
	13 = control-fields (1 byte)
		4 bits (low-order) = bufferType (logical-type indicator of one of my subclasses)
		4 bits (high-order) = indexed position into my class' #bpMaps Array, this value 0-15 (so +1 for access), the attribute-map Dictionary, mapping each attribute Symbol (i.e., #oid) to its bufferPosition.  This allows advanced users like Magma to add its fields without interfering into the simpler nature of Ma object serialization.
		bpMaps:
			at: 0 = Ma object serialization minimum.
			at: 1 = Magma-added fields
	14 = classId (2 bytes)