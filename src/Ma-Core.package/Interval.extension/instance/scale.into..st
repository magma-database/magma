*ma-core
scale: aNumber into: anotherInterval 
	"Answer the relative position of aNumber in anotherInterval, based on its position in the receiver."
	| fractionalPosition |
	fractionalPosition := (aNumber - start) / (stop - start).
	^ anotherInterval last - anotherInterval first * fractionalPosition + anotherInterval first