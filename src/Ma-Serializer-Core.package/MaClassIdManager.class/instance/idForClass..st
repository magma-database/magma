accessing
idForClass: aClass

	^self
		idForClass: aClass
		ifAbsent: [ MaSoftwareError signal: aClass name, ' has no id assigned.' ]