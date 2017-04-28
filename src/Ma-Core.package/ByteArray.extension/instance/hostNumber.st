*ma-core
hostNumber
	"This is here for Pharo compatibility.  It is overridden by Pharo's SocketAddress."
	^ String streamContents: 
		[ : stream | 
		self do: 	[ : each | stream maPrint: each]
		      separatedBy: [ stream maPrint: $. ]]
