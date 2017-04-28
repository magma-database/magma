*ma exception handling
maIsHeadless
	"Display global appears to be set even when headless.  So checking the -vm arguments looking for headless operation."
	-1000 
		to: -1
		do: 
			[ : n | 
			(#('display=none' '-headless' '-vm-display-null') includes: (self getSystemAttribute: n)) ifTrue: [ ^ true ] ].
	^ false