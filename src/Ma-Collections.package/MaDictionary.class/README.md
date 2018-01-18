| sd md r | 
Transcript clear.
r := OrderedCollection new.
ByteString allInstancesDo: [:each | r add: each ].
Smalltalk garbageCollect.
sd := Dictionary new.
Transcript cr; show: 'time to add all strings to sd: ', 
	[ r do: [:each | sd at: each put: each ] ] timeToRun printString.
Smalltalk garbageCollect.
sd := MaDictionary new.
Transcript cr; show: 'time to add all strings to md: ', 
	[ r do: [:each | sd at: each put: each ] ] timeToRun printString.


r _ (1 to: 15500) collect: [ :e | Object new ].
r _ r shuffled.
Smalltalk garbageCollect.
sd _ WeakIdentityKeyDictionary new.
md _ MaWeakIdentityKeyDictionary new.
Transcript cr; show: 'time to add to sd: ', ([ r do: [ :each | sd at: each put: each ] ] timeToRun) printString.
Transcript cr; show: 'time to add to md: ', ([ r do: [ :each | md at: each put: each ] ] timeToRun) printString.
r_r shuffled.
Transcript cr; show: 'time to access to sd: ', ([ r do: [ :each | sd at: each ] ] timeToRun) printString.
Transcript cr; show: 'time to access to md: ', ([ r do: [ :each | md at: each ] ] timeToRun) printString.
r _ r shuffled.
Transcript cr; show: 'time to replace to sd: ', ([ r do: [ :each | sd at: each put: each ] ] timeToRun) printString.
Transcript cr; show: 'time to replace to md: ', ([ r do: [ :each | md at: each put: each ] ] timeToRun) printString.
r _ r shuffled.
Transcript cr; show: 'time to remove 300 from sd: ', ([ (r copyFrom: 1 to: 300) do: [ :each | sd removeKey: each ] ] timeToRun) printString.
Transcript cr; show: 'time to remove 300 from md: ', ([ (r copyFrom: 1 to: 300) do: [ :each | md removeKey: each ] ] timeToRun) printString.
