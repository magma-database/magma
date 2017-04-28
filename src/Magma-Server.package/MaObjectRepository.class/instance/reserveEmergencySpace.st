initialize-release
reserveEmergencySpace
	EmergencyMemory isEmptyOrNil ifTrue: [ EmergencyMemory := String new: 50 million ]