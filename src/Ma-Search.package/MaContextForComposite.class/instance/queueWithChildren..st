overriding
queueWithChildren: parentObject 
	| children |
	self queue: parentObject.
	children := parentObject perform: childrenSelector.
	children do: 
		[ : each | 
		self shouldStopScanning ifTrue: [ ^ self ].
		self queueWithChildren: each ]