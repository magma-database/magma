accessing
baseColor
	"Answer the base color to calculate other colors from"
	| baseColor current |

	baseColor := self color.
	current := self.
	[current notNil & (baseColor = Color transparent)]
		whileTrue: [""
			baseColor := current color.
			current := current owner].
	^ baseColor