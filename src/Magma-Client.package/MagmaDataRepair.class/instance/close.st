private
close
	session ifNotNil:
		[ session disconnectAndClose.
		session := nil.
		MagmaNotification signal: 'session closed.' ]