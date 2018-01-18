access
port
	"The TCP/IP port through which my conductor communicates with me."
	^ link
		ifNil: [ (Smalltalk argumentAt: 1) asInteger ]
		ifNotNil: [ link port ]