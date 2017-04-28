enumerate
do: aBlock 
	1 
		to: self size
		do: [ : x | aBlock value: (self at: x) ]