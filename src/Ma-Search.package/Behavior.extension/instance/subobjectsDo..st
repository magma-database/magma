*ma-search
subobjectsDo: aBlock 
	"Enumerate the appropriate objects I have links to for purposes of a generic keyword search function."
	methodDict do: [ : each | aBlock value: each ]