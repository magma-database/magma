enumeration
slowlyDo: oneArgBlock pageBoundariesDo: aBlock 
	"Enumerate all objects of the receiver, value oneArgBlock with each object."
	| count |
	count := 0.
	table do:
		[ : each | oneArgBlock value: each.
		count := count + 1.
		count \\ self enumerationPageSize = 0 ifTrue: [ aBlock value ] ]