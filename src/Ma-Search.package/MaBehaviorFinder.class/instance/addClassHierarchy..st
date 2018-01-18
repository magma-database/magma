classes
addClassHierarchy: aClass
	"Adds the methods in aClass as well as all of its superclasses."

	self addSuperclassHierarchy: aClass.
	self addSubclassHierarchy: aClass
