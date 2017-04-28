*magma-client
mergeConflicting: aDictionary 
	"aDictionary is my version, the receiver is updated to the other session's version.  First check whether we conflict on the same key.  If not, go ahead and merge my keys from aDictionary into the receiver and retry."
	aDictionary keysAndValuesDo:
		[ : eachKey : eachValue | self
			at: eachKey
			ifPresent:
				[ : committedByOther |
				"Must check for #== first because Float nan ~= Float nan!!"
				(eachValue == committedByOther realObjectIfMutatingProxy or: [eachValue = committedByOther realObjectIfMutatingProxy]) ifFalse: [ ^ false ] ]
			ifAbsent:
				[ self
					at: eachKey
					put: eachValue ] ].
	^ true