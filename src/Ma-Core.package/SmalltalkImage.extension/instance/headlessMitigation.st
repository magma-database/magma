*ma-core
headlessMitigation
	"If I'm headless and RFB is present, start an RFBServer on port identified by rfbPort."
	(Smalltalk classNamed: #RFBServer) ifNotNil:
		[ : rfbServer | "RFBServer will add 5900 to the port, so we're not using the same port # twice."
		rfbServer
			 setEncryptedFullPassword: #[147 229 129 70 7 14 51 97] ;
			 start: (self rfbPort ifNil: [ 5900 ])-5900 ]