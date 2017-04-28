accessing
name
	"How people refer to this repository."
	^ name ifNil: [ self uuid printString ]