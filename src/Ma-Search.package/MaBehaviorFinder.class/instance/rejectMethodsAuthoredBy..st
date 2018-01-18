methods
rejectMethodsAuthoredBy: aString 
	"Removes all but the methods named aString"
	self rejectMethods: [ : each | each maAuthor = aString ]