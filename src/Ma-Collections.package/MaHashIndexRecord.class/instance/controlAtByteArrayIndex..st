private
controlAtByteArrayIndex: anInteger
	^ byteArray 
"		maUint: SizeOfControlFieldInBits"
		byteAt: anInteger+1 "+ ControlEntryOffset"  "<-- avoid extra send for performance"