private
preSerialize: anObject 
	"maPreserialize could be useful for when you don't necessarily require serialization, but needed so that it *can* be used, if desired."
	(anObject respondsTo: #maPreSerialize) ifTrue: [ anObject maPreSerialize ].
	anObject maOriginalClass withAllSuperclassesDo: 
		[ : eachClass | 
		preferences preSerializers 
			at: eachClass name
			ifPresent: 
				[ : valuators | 
				valuators do: [ : each | each valueWithArguments: {  anObject  } ] ]
			ifAbsent: 
				[ "do nothing"
				 ] ]