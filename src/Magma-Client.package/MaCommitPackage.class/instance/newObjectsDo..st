enumerate
newObjectsDo: aBlock
	"This can only be used after the receiver has serialialized his objects
	(via #serializeObjectsUsing:)."

	| isRootBuffer |
	"Skip the first buffer because that is the receivers objects OC itself, not part of any client objects."
	isRootBuffer := true.
	objects buffersDo:
		[ :each |
		isRootBuffer
			ifTrue:
				[ isRootBuffer := false ]
			ifFalse:
				[ (MaOidCalculator isOidForNewObject: each oid) ifTrue: [ aBlock value: each ] ] ]
