accessing
magmaSession
	"For API compatibility with any object.  Any object knows its MagmaSession, but the session for any MagmaSession object is himself.  This method was added to allow MaInstaller to #close: down the session for any object, not just a session."
	^ self