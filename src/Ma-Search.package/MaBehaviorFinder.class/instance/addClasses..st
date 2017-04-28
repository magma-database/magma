classes
addClasses: classesCollection

	"Adds all methods in each class in classesCollectoin"

	classesCollection do: [ :each | self addClass: each ]
