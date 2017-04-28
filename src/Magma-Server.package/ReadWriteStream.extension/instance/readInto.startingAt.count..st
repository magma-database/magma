*magma-server
readInto: aByteArray startingAt: startIndex count: numberOfBytes
	"Read n objects into the given collection.  Return the number of bytes read."

	| count |
	count := 0.
	[ count < numberOfBytes ]
		whileTrue:
			[ | byte |
			byte := self next.
			byte
				ifNil: [ ^ count ]
				ifNotNil:
					[ aByteArray
						at: startIndex+count
						put: byte ].
			count := count + 1 ].
	^ count