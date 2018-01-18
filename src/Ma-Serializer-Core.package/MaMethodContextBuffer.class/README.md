A MaMethodContextBuffer is a special buffer to represent instances of MethodContext.  This is necessary because of the special-nature of MethodContexts; that you must know the correct frame size (small or full) but that is separate from the number of instance-variables it has.  Therefore, we add an attribute, #frameSize to the header.

	(see superclass)
	12 = control-byte
		bit 1 (low-order bit) "largeFrame"
			0 = CompiledMethod smallFrameSize
			1 = CompiledMethod fullFrameSize