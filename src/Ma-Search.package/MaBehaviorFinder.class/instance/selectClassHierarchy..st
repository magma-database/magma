classes
selectClassHierarchy: aClass 
	"Select all methods in the receiver which exist in aClass as
	well as all of its super and subclasses."
	| fullHiearchy |
	fullHiearchy := aClass withAllSubclasses asSet
		addAll: aClass allSuperclasses ;
		yourself.
	self selectMethods: [ : each | fullHiearchy includes: each actualClass ]