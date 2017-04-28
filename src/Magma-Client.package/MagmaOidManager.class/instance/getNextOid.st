private
getNextOid
	| ans |
	^ (MaOidCalculator isOidForNewObject: (ans := super getNextOid))
		ifTrue: [ ans ]
		ifFalse: [ MagmaUserError signal: 'Cannot support more than about 4M objects in a single commit.' ]