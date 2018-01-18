methods
selectMethodsNamed: aString 
	"Removes all but the methods named aString"
	self selectMethods: [ : each | each selector = aString ]