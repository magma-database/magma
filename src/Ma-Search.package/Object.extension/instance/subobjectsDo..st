*ma-search
subobjectsDo: aBlock 
	"Enumerate the appropriate objects I have links to for purposes of a generic keyword search function."
	"Only do Pointer objects, skipping globals."
	({ 
		World.
		ActiveHand.
		Transcript.
		Processor.
		Compiler.
		Sensor
	 } includes: self) ifTrue: [ ^ self ].
	aBlock value: self.
	self maOriginalClass isPointers ifTrue: 
		[ 1 
			to: self maOriginalClass instSize
			do: [ : n | (self slotAt: n) subobjectsDo: aBlock ] ]