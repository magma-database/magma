file
commitLogRecordsFrom: startCommitNumber do: aBlock until: untilBlock 
	"Enumerate my MaCommitLogRecords beyond my commitNumber.  Value aBlock with the first-class instance of MaCommitLogRecord."
	| untilReached |
	untilReached := false.
	repository flushCritical: 
		[ self 
			commitLogFileStreamsFrom: startCommitNumber
			do: 
				[ : eachStream | 
				untilReached ifFalse: 
					[ untilReached := untilReached or: 
						[ self 
							commitLogRecordsFrom: startCommitNumber
							in: eachStream
							do: aBlock
							until: untilBlock ] ] ]
			unless: [ untilReached ] ]