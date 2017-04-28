capacity management
isLowOnMemory
	^ Smalltalk maMemoryAvailable < (MaSerializedGraphBuffer unreasonablePhysicalSize + EmergencyMemory size)