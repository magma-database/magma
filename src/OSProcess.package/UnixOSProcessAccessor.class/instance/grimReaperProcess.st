initialize - release
grimReaperProcess
	"This is a process which waits for the death of a child OSProcess, and 
	informs any dependents of the change. Use SIGCHLD events if possible,
	otherwise a Delay to poll for exiting child processes."

	| eventWaiter processSynchronizationDelay |
	^ self canAccessSystem
		ifTrue:
			[eventWaiter := (self canAccessSystem and: [self canForwardExternalSignals])
				ifTrue: [self sigChldSemaphore "semaphore signaled by SIGCHLD" ]
				ifFalse: [Delay forMilliseconds: 200 "simple polling loop" ].
			processSynchronizationDelay := Delay forMilliseconds: 20.
			grimReaper ifNil:
				[grimReaper :=
					[[(eventWaiter respondsTo: #waitTimeoutMSecs: )
						ifTrue: [eventWaiter waitTimeoutMSecs: 1000 "semaphore with timeout"]
						ifFalse: [eventWaiter wait].
					processSynchronizationDelay wait. "Avoids lost signals in heavy process switching"
					self changed: #childProcessStatus] repeat] newProcess.
					grimReaper resume.
					"name selected to look reasonable in the process browser"
					grimReaper name: ((ReadStream on: grimReaper hash asString) next: 5)
							, ': the child OSProcess watcher']]
		ifFalse:
			[nil]
