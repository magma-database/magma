accessing
reSort
	children do: [ : each | each maIsSortedCollection ifTrue: [ each reSort ] ]