user-responsibility
check: anObject 
	"Your data-repair script must send #check: to the passed-in DataRepair object (2nd arg of the block), with the object to be checked by the checkBlock.  See the class comment for an example."
	(checkBlock
		cull: anObject
		cull: self) ifTrue:
		[ count := count + 1.
		doBlock
			cull: anObject
			cull: self.
		(self improveMode and: [ (Time millisecondsSince: lastCommit) > (80 * 1000) ]) ifTrue:
			[ session commitAndBegin.
			lastCommit := Time millisecondClockValue ] ]