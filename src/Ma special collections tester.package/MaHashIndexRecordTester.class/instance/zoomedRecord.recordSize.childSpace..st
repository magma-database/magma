private creation
zoomedRecord: keySize recordSize: recordSize childSpace: anInteger

	| answer prior |
	answer :=
		MaHashIndexRecord
			keySize: keySize
			valueSize: 64
			numberOfSlots: recordSize.
	[ (answer highKey - answer lowKey) > anInteger ]
		whileTrue:
			[ prior := answer.
			answer := answer
				beZoomedInToward: (answer lowKey to: answer highKey) atRandom
				from: answer ].
	^ (answer highKey - answer lowKey) < 1000
		ifTrue: [ prior ]
		ifFalse: [ answer ]