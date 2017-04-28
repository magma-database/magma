code base
getCode
	"Answer the Dictionary of Streams that was manually installed in the server that can be browsed or filed-in to be able to connect to my repostory."
	"Calls #codeBaseByteArray."
	^ guard critical: 
		[ | code classesAndCode |
		classesAndCode := self secondarySubmit: MaDownloadCodeRequest new.
		self loadClassDefinitionsFrom: classesAndCode first.
		code := serializer materializeGraph: classesAndCode last.
		code ]