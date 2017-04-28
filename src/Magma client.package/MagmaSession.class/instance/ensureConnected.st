initialize-release
ensureConnected
	"When stale proxies or MagmaCollections are provoked, ensure their session connects."
	self isConnected ifFalse: 
		[ user ifNil: [ user := MagmaUserRequiredNotification requestUserFor: self ].
		user ifNil: [ MagmaUserError signal: 'A user to connect must be supplied.' ].
		self connect: user ]