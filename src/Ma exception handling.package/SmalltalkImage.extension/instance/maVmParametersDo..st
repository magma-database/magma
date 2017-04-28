*ma exception handling
maVmParametersDo: aBlock 
	"Display global appears to be set even when headless.  So checking the -vm arguments looking for headless operation."
	-1 
		to: -1000
		by: -1
		do: 
			[ : n | 
			| attr |
			attr := self getSystemAttribute: n.
			attr ifNotNil: [ aBlock value: attr ] ]