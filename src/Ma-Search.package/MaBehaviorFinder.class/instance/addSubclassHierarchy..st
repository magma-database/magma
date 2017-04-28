classes
addSubclassHierarchy: aClass

	"Adds the methods in aClass as well as all of its subclasses."

	aClass withAllSubclassesDo: [ :each | self addClass: each ]
