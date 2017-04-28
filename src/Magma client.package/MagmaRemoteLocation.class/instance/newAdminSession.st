factory
newAdminSession
	"Answer a session that does not fail over to any backup.  These sessions are used for communicating between the servers of a node themselves."
	^ self newSession
		allowFailover: false ;
		yourself