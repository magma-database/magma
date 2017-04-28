private
fixSession
	"It shouldn't happen, but if session's become nil'd out (maybe due to a becomeForward: nil), then this will attempt to restore it."
	session ifNil:
		[ realObject magmaSession ifNotNil:
			[ : sess | session := sess.
			session addProxy: self ] ]