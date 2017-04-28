A MaCompiledMethodBuffer encapsulates all data needed to instantiate a CompiledMethod.  CompiledMethod objects are special because they store bytes and pointers.  Therefore, this buffer type maps additional fields essential to storing CompiledMethods.

	(see superclass)
	18 = methodHeader (4 bytes)
	22 = byteCodesPlusTrailerSize (4 bytes).
	26 = first inst-var
	28 = second inst-var
		... etc...
	nn = byteCodes plus trailer bytes

		OR (in Magma only)

	(see superclass)
	16 = commitNumber (6 bytes)
	22 = method header (4 bytes)
	26 = filler (2 bytes)
	28 = classVersion (2 bytes)
	30 = byteCodesPlusTrailerSize (4 bytes)
	34 = first inst-var
	40 = second inst-var
		... etc...
	nn = byteCodes plus trailer bytes

I inherit from MaMethodContextBuffer for implementation-conveniences, not because a MaCompiledMethodBuffer is-a MaMethodContextBuffer.