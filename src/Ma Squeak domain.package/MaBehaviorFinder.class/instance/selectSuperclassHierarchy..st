classes
selectSuperclassHierarchy: aClass 
	"Select all methods in the receiver which exist in a aClass as or any of aClass superclasses."
	| hierarchy |
	hierarchy := aClass withAllSuperclasses.
	self selectMethods: [ : each | hierarchy includes: each actualClass ]