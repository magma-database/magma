classes
rejectSubclassHierarchy: aClass 
	"Reject all methods in the receiver which exist in a aClass or any of aClass subclasses."
	| hierarchy |
	hierarchy := aClass withAllSubclasses asSet.
	self rejectMethods: [ : each | hierarchy includes: each actualClass ]