private
maMaterializeFromGraph: aByteArray using: aMaObjectSerializer
	"A domain object referenced his own session, recover that with a reference to whatever session is materializing."
	| answer |
	MagmaSessionRequest 
		signal: 'a session reference' 
		do: [ : aMagmaSession | answer := aMagmaSession ].
	^ answer