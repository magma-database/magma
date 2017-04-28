private
maAllowsWriteBarrier
	"In one of the tests, an instance of MagmaTestCase, itself, gets serialized.  However, no object which refers to the MagmaSession should allow WB because, once my 'clientSession' is replaced with a new session, my old session and its WB becomes GC'd, so my methods start blowing up because their writeBarrier is nil."
	^ false