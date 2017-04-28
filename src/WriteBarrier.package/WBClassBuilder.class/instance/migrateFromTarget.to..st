private
migrateFromTarget: oldSuperclass to: newSuperclass
	| oldClass |
	oldClass := class.
	oldClass superclass: oldSuperclass.
	class := self createSubclassOf: newSuperclass.
	class updateInstancesFrom: oldClass