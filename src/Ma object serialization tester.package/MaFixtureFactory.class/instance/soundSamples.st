private non-collection samples
soundSamples
| classGetter |
classGetter := [ : name |  (Smalltalk classNamed: #PluckedSound) ifNotNilDo: [ : theClass | theClass default ]. ].
^#(PluckedSound Speaker)  collect:
[ : eachClassName |
	classGetter value: eachClassName ]