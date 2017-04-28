accessing
magmaSession
	"Answer the connected MagmaSession that the receiver was retrieved in.  If I am not an object retrieved from any session, answer nil."
	^ session ifNil: [ realObject magmaSession ]