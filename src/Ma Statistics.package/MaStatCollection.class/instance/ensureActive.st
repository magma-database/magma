accessing
ensureActive
	"My historys should only ever be started and stopped together, as a group."
	self isActive ifFalse: [ self transition ]