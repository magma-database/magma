private
adjustLastKnownSize: anInteger 
	(segments notEmpty and: [ segments last atEnd ]) ifTrue: [ segments last adjustLastKnownSize: anInteger ]