*ma-core
maMarked: aString
	"This is a marker method used to indicate that we wish to come back and re-examine
	code in the future for possible improvement.  For now, try to keep improvements categorized
	via anEsAtom that we can Browse References to, if necessary.  The possibilities should be:

		'ugly'
		'performance'
		'bug'
		'dev'
		'vmSpecific'
		'releaseSpecific'
		'otherPackageSupport'
		'system override'
		'deprecated'
		'magic'
		'debug'
	A *comment* then should follow to provide more detail."

	aString = 'delete' ifTrue: [ self halt: 'Oops..  looks like you still need this method.' ]