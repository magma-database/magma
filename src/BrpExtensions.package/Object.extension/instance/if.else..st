*BrpExtensions
if: aCondition else: anObject

	^ aCondition value
		ifTrue: [ self ]
		ifFalse: [ anObject ]