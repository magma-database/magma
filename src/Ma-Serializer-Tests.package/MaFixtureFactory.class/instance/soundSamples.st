private non-collection samples
soundSamples
| classGetter |
classGetter := [ : name |  (Smalltalk classNamed: #PluckedSound) ifNotNil: [ : theClass | theClass default ]. ].
^#(PluckedSound Speaker)  collect:
[ : eachClassName |
	classGetter value: eachClassName ]