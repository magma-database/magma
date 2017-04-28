private
createSubclassOf: aClass
	| meta |
	meta := Metaclass new.
	meta
		superclass: aClass class
		methodDictionary: MethodDictionary new
		format: aClass class format.
	class := meta new.
	class
		superclass: aClass
		methodDictionary: MethodDictionary new
		format: aClass format.
	class setName: aClass name, '*'.
	^ class
