accessing
size
	^ subcontexts 
		inject: 0
		into: [ : sum : each | sum + each size ]