*ma base additions
maSpyOn: aBlock toFileNamed: fileName reportOtherProcesses: aBoolean if: conditionBlock 
	conditionBlock value
		ifTrue:
			[ self
				spyOn: aBlock
				toFileNamed: fileName
				reportOtherProcesses: aBoolean ]
		ifFalse: aBlock