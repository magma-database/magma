private
slotAt: index 
	"Access the nth slot of an object.  Use the instVarAt: primitive for speed with fixed, non-variable objects."

	<primitive: 73>
	"Access beyond fixed variables."
	^self basicAt: index - self class instSize