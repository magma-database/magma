write-barrier
canEnableWriteBarrier
	^ #(#BytecodeGenerator #WriteBarrier ) allSatisfy: [ : each | Smalltalk hasClassNamed: each ]