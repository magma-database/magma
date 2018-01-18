subtask-reporting
startSubtask
	"Start a new subtask."
	^ subtask := self copy
		 parentTask: self ;
		 yourself