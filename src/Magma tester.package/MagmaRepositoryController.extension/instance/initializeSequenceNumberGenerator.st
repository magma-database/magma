*magma tester
initializeSequenceNumberGenerator
	"Have my session cache the MagmaCounter that will be accessed many hundreds of times (in a real-world app, that is) so performance is maximized."
	| sess counter |
	sess := self session.
	counter := MagmaCounter new.
	sess
		cacheAt: #testSequenceNumberGenerator
			put: counter ;
		commit: 
			[ sess root 
				at: #testSequenceNumberGenerator
				put: counter ].
	^ nil