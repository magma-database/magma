arithmetic
- arg 
	arg isPoint ifTrue: [ ^ self x - arg x @ (self y - arg y) ].
	^ arg
		adaptToPoint: self
		andSend: #-