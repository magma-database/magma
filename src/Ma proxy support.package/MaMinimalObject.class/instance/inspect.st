debugging
inspect
	"Create and schedule an Inspector in which the user can examine the receiver's variables."

	self inspectorClass openOn: self withEvalPane: true
