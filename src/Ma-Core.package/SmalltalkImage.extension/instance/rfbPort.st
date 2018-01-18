*ma-core
rfbPort
	"Answer the specified port to be used by the RFB server."
	#('rfbPort' 'port' ) do:
		[:eachPortFile | (FileDirectory default fileExists: eachPortFile) and: [^ FileStream
				fileNamed: eachPortFile
				do:
					[:stream | stream contents asInteger]]].
	^ nil