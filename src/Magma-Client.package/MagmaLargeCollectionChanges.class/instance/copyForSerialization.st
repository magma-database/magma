copying
copyForSerialization

	| newChanges |

	newChanges := changes species new.
	changes keysAndValuesDo:
		[ :eachKey :eachValue |
		newChanges
			at: eachKey
			put: eachValue copy ].
	^self copy changes: newChanges
