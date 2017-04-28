*ma-core
maIsLowOnMemory
	"Answer whether the VM is within ten-million bytes of available memory.  The goal is to avoid the LowSpace warning."
	^ self maMemoryAvailable < 10000000