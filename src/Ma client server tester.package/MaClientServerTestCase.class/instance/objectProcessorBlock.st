test object server
objectProcessorBlock
	^ [ : aMacsTestRequest | MacsTestResponse fromRequest: aMacsTestRequest ]