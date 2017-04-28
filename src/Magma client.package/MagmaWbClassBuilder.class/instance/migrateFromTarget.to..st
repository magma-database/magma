as yet unclassified
migrateFromTarget: oldSuperclass to: newSuperclass

	| oldClass |
self halt.
	oldClass := class.
	"Was the immediate WriteBarrier superclass modified (or was it a superclass of that)?"
	(oldClass superclass == newSuperclass)
		ifTrue:
			[ oldClass superclass: oldSuperclass.
			class := self createSubclassOf: newSuperclass.
			class updateInstancesFrom: oldClass ]
		ifFalse:
			[ "Although my class refers to the proper superclass, it must be rebuilt because its format has changed and must now be updated."
			class := self createSubclassOf: oldClass superclass.
			ClassBuilder new mutate: oldClass to: class
"			self
				updateInstancesOf: oldClass
				to:  class" ]