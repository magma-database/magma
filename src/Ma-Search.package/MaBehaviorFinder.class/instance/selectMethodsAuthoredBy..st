methods
selectMethodsAuthoredBy: aString 
	"Removes all but the methods named aString"
	self selectMethods: [ : each | each maAuthor = aString ]