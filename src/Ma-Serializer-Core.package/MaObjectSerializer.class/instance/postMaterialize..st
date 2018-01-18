private
postMaterialize: anObject 
	"maPostMaterialize could be useful for when you don't necessarily require serialization, but needed so that it *can* be used, if desired."

	(anObject respondsTo: #maPostMaterialize) 
		ifTrue: [anObject maPostMaterialize].
	anObject maOriginalClass withAllSuperclassesDo: 
			[:eachClass | 
			preferences postMaterializers 
				at: eachClass name
				ifPresent: 
					[:valuators | 
					valuators do: [:each | each valueWithArguments: { 
										anObject}]]
				ifAbsent: 
					["do nothing"

					]]