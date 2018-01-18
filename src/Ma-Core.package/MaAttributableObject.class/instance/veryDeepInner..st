copying
veryDeepInner: aDeepCopier 
	super veryDeepInner: aDeepCopier.
	attributes := attributes copy.
	self attributesToDeepCopy do:
		[ : eachAttribute | attributes
			at: eachAttribute
			ifPresent:
				[ : value | attributes
					at: eachAttribute
					put: (value veryDeepCopyWith: aDeepCopier) ]
			ifAbsent: [ self error: eachAttribute , ' is not an attribute.' ] ]