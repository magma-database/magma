recovery
flushCache
	"Flush all caches as an uncorruptible unit-of-work.  If this forked code completes all files are flushed.  Should a power outage occur somewhere in the middle, the recovery will reverse what had been written so far."
	"Define what we're going to do to (flush) into a block, since we have to determine whether to time it."
	| stats |
	stats := repositoryController serverStatistics.
	stats flushTimeHistory addValue: (Time millisecondsToRun: 
			[ recoveryManager beginApply.
			self
				captureBeforeImages ;
				flushIndividualCaches.
			SimulateOutage ifTrue: [ self simulateOutage ].
			recoveryManager endApply ])