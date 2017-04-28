subtask-reporting
returnFromSubtask
	"After finishing a subtask, disconnect it."
	^ parentTask ifNotNil:
		[ parentTask subtask: nil.
		parentTask ]