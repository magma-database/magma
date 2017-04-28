private
commitLogFileNamesFrom: startNumber do: oneArgBlock 
	"Create a SortedCollection of the entries by the commitLogNumber.  Attach the original names so we don't have to reconstruct them after the sort."
	| selectedEntries sortedEntries dir |
	selectedEntries := OrderedCollection new.
	dir := self commitLogDirectory.
	dir exists ifFalse: [ ^ Array empty ].
	dir entries do:
		[ : each | | nameParts |
		nameParts := dir splitNameVersionExtensionFor: each name.
		(nameParts at: 2) >= startNumber ifTrue: [ selectedEntries add: {each name. nameParts} ] ].
	sortedEntries := selectedEntries asSortedCollection:
		[ : a : b | a second second < b second second ].
	sortedEntries do:
		[ : each | oneArgBlock value: (self commitLogDirectory fullNameFor: each first) ]