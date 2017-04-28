access
remotePerform: selector withArguments: anArray

	| result |
	result := testCase
		perform: selector
		withArguments: anArray.
	^ (result == testCase or: [ result == self ])
		ifTrue: [ nil ]
		ifFalse: [ result ]