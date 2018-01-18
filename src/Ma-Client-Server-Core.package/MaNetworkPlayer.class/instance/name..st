setup
name: aString
	"Do not allow single-quotes in the name because it must be used as a command-line argument."
	name := aString copyWithout: $'