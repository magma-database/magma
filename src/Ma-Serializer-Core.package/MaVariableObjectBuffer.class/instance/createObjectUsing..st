creation
createObjectUsing: aMaObjectSerializer
	| class |
	class := self ensureClassUsing: aMaObjectSerializer.
	"Set and Dictionary are special-case for this because we store their logical rather than physical representation.  Therefore, dispatch to the class to build the skeleton for VariableObjectBuffers."
	^ class newSkeletonFor: self