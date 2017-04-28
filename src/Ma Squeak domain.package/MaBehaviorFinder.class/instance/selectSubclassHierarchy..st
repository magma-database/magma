classes
selectSubclassHierarchy: aClass 
	"Select all methods in the receiver which exist in a aClass or any of aClass subclasses."
	| hierarchy |
	hierarchy := aClass withAllSubclasses asSet.
	self selectMethods: [ : each | hierarchy includes: each actualClass ]