methods
rejectMethodsNamed: aString 
	"Removes all methods named aString"
	self rejectMethods: [ : each | each selector = aString ]