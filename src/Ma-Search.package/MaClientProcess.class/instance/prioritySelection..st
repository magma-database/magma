accessing
prioritySelection: prioritySymbol 
	"#userBackgroundPriority - for background processes to run only when the UI or other higher priority processes are running.

		#userSchedulingPriority - The UI shares an equal slice of time with all processes at this priority.

		#userInterruptPriority - For processes desiring immediate service.  WARNING:  The UI will be unresponsive until the process completes."
	self isTerminated ifTrue: [ ^ self ].
	self priority: (Processor perform: prioritySymbol)