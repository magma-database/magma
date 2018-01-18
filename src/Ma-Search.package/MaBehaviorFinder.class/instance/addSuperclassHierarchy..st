classes
addSuperclassHierarchy: aClass
	"Adds the methods in aClass as well as all of its subclasses."

	aClass withAllSuperclassesDo: [ :each | self addClass: each ]
