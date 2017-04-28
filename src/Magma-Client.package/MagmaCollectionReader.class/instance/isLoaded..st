private
isLoaded: anInteger
	"Answer whether I have the page of objects loaded which includes anInteger index."
	^ segment notNil and: [ segment includesIndex: 1 ]