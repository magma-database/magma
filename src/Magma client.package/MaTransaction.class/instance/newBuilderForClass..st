writebarrier
newBuilderForClass: aClass
	MagmaNotification signal: 'Compiling anonymous subclass of ', aClass name.
	^ MagmaWbClassBuilder
		target: aClass 
		barrier: self