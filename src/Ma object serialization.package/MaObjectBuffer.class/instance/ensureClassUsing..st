private
ensureClassUsing: aMaObjectSerializer

	^ (aMaObjectSerializer classIdManager
		classForId: self classId
		ifAbsent:
			[ "going to materialize an instance of the missing class."
			| sourceDefinition |
			sourceDefinition :=
				(aMaObjectSerializer classIdManager classDefinitionsForId: self classId) last.  "the most-recent one is the best guess."
			sourceDefinition createClassUsing: aMaObjectSerializer ])