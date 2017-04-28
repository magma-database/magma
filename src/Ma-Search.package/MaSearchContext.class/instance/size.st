results access
size
	"The number of results."
	^ results 
		ifNil: [ 0 ]
		ifNotNil: [ self results size ]