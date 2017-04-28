private
olderOf: firstVersion and: secondVersion 
	"Answer whichever version, the first or second, is the older one.  Choose the one with the smaller versionNumber or earlierDate."
	^ firstVersion versionNumber < secondVersion versionNumber
		ifTrue: [ firstVersion ]
		ifFalse:
			[ secondVersion versionNumber < firstVersion versionNumber
				ifTrue: [ secondVersion ]
				ifFalse:
					[ firstVersion dateAndTime < secondVersion dateAndTime
						ifTrue: [ firstVersion ]
						ifFalse: [ secondVersion ] ] ]