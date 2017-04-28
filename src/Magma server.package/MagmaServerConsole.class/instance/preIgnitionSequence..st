private
preIgnitionSequence: portInteger 
	| nodeUpdates |
	nodeUpdates := OrderedCollection new.
	[ self checkIfAmPrimaryOvertaken: portInteger ] 
		on: MagmaNodeUpdate
		do: 
			[ : update | 
			nodeUpdates add: update.
			update resume ].
	(nodeUpdates notEmpty and: [ self restoreMode not ]) ifTrue: 
		[ self serverSession commit: [ nodeUpdates do: [ : each | each applyTo: self node ] ] ].
	self updatePrimaryLocation: portInteger.
	self statistics transition