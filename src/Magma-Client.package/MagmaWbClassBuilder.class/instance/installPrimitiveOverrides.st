as yet unclassified
installPrimitiveOverrides
	"Override all primitive methods which take an argument to be sure not to send it a MagmaMutatingProxy."
	class allSuperclassesDo:
		[ : eachClass | eachClass methodDictionary do:
			[ : eachMethod | (eachMethod primitive > 0 and:
				[ eachMethod selector isUnary not and: [ (class methodDictionary includesKey: eachMethod selector) not ] ]) ifTrue: [ self addPrimitiveOverride: eachMethod selector ] ] ]