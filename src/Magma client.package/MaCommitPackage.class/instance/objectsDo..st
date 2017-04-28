enumerate
objectsDo: aBlock

	objects isCollection
		ifTrue:
			[ objects do: aBlock ]
		ifFalse:
			[ | isRootBuffer |
			"Skip the first buffer because that is the receivers objects OC itself, not part of any client objects."
			isRootBuffer := true.
			objects buffersDo:
				[ :each |
				isRootBuffer ifTrue: [ isRootBuffer := false ] ifFalse: [ aBlock value: each ] ] ]