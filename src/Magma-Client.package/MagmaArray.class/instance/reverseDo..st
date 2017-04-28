enumerate
reverseDo: aBlock 
	self size 
		to: 1
		by: -1
		do: [ : x | aBlock value: (self at: x) ]