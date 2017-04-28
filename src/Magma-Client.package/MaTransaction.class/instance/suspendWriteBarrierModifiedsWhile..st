writebarrier
suspendWriteBarrierModifiedsWhile: aBlock 
	"Employ 'priorValue' to support nested suspendWriteBarrierModifiedsWhile: 's."
	| priorValue |
	priorValue := ignoreModifiedSignals.
	ignoreModifiedSignals := true.
	^ aBlock ensure: [ ignoreModifiedSignals := priorValue ]