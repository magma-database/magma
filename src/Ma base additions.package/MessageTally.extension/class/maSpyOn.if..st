*ma base additions
maSpyOn: spyBlock if: conditionBlock 
	^ conditionBlock
		ifTrue: [ self spyOn: spyBlock ]
		ifFalse: spyBlock