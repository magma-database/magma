classes
addCommonBehaviorForClass: aClass 
	"Adds all methods in aClass, plus its superclasses other than Object and ProtoObject."
	| inheritedBehaviors |
	inheritedBehaviors := { 
		(Object class).
		(ProtoObject class).
"		Class.
		ClassDescription.
		Behavior."
		Object.
		ProtoObject
	 }.
	aClass withAllSuperclassesDo: 
		[ : each | 
		((inheritedBehaviors includes: each) and: [ (inheritedBehaviors includes: aClass) not ]) ifFalse: [ self addClass: each ] ]