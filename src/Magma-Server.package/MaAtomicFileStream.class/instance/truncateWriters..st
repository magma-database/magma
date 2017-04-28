private
truncateWriters: filePosition 
	| toBeRemoved |
	guard critical: 
		[ uncommittedSize := uncommittedSize min: filePosition.
		toBeRemoved := OrderedCollection new.	"Not sure if I can remove from a BTree while enumerating it.."
		writers 
			from: filePosition
			to: 999999999999999999999
			do: 
				[ : each | 
				(each coversFilePosition: filePosition) ifTrue: [ toBeRemoved add: each ] ].
		toBeRemoved do: [ : each | writers removeKey: each endFilePos ] ]