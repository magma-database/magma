*magma-server
depthOfAttribute: attributeIndex onClassWithId: classId version: versionNumber
	"Answer the depth that the attribute at attributeIndex should be traversed into *from the current depth*."

	^depths
		at: { classId. versionNumber }
		ifPresent:
			[ :depth |
			depth isInteger
				ifTrue: [ depth ]
				ifFalse: [ depth at: attributeIndex ifAbsent: [ 0 ] ] ]
		ifAbsent: [ 0 ]