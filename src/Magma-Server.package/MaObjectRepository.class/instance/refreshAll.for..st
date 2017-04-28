client-requests
refreshAll: oidsCollection for: sessionId 
	"We will use a minimal strategy because we really just want exactly the buffers requested.  So save whatever the sessions current strategy."
	| answer sessionReadStrategy minimalStrategy |
	sessionReadStrategy := (self sessionWithId: sessionId) currentReadStrategy.
	minimalStrategy := MaBasicReadStrategy minimumDepth: 0.
	answer := Array streamContents: 
		[ : stream | 
		oidsCollection do: 
			[ : eachRequestedOid | 
			(MaOidCalculator isOidForUserObject: eachRequestedOid) ifTrue: 
				[ stream nextPut: 
					(MaSerializedGraphBuffer byteArray: 
						(self 
							read: eachRequestedOid
							for: sessionId
							using: minimalStrategy) byteArray) ] ] ].
	"Now restore the readStrategy to whatever it was."
	(self sessionWithId: sessionId) currentReadStrategy: sessionReadStrategy.
	^ answer