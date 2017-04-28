classes
rejectSuperclassHierarchy: aClass 
	"Reject all methods in the receiver which exist in a aClass as or any of aClass superclasses."
	| hierarchy |
	hierarchy := aClass withAllSuperclasses.
	self rejectMethods: [ : each | hierarchy includes: each actualClass ]