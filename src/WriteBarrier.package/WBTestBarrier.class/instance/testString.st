as yet unclassified
testString
	| string |
	string := 'test' copy.
	Smalltalk isRunningCog
		ifTrue:
			[ self
				should: [ self enableWriteBarrier: string ]
				raise: Error ]
		ifFalse:
			[ self
				shouldnt: [ self enableWriteBarrier: string ]
				raise: Error ]