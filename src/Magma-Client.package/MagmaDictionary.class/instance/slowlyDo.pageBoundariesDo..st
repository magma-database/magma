enumerating (slow)
slowlyDo: oneArgBlock pageBoundariesDo: aBlock 
	"Enumerate all Associations of the receiver, value oneArgBlock with each association."
	| count |
	count := 0.
	table do:
		[ : eachAssociation | oneArgBlock value: eachAssociation.
		count := count + 1.
		count \\ self enumerationPageSize = 0 ifTrue: [ aBlock value ] ]