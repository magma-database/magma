writebarrier
newBuilderForClass: aClass
	^ MagmaWbClassBuilder
		target: aClass 
		barrier: self