private
postSerialize: anObject 
	"maPostSerialize could be useful for when you don't necessarily require serialization, but needed so that it *can* be used, if desired."

	(anObject respondsTo: #maPostSerialize) ifTrue: [anObject maPostSerialize].
	anObject maOriginalClass withAllSuperclassesDo: 
			[:eachClass | 
			preferences postSerializers 
				at: eachClass name
				ifPresent: [:valuators | valuators do: [:each | each value: anObject]]
				ifAbsent: 
					["do nothing"

					]]