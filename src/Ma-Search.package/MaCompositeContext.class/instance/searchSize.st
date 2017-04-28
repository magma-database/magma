accessing
searchSize
	^ subcontexts 
		inject: 0
		into: [ : sum : each | sum + each searchSize ]