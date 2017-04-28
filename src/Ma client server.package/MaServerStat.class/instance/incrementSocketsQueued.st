recording
incrementSocketsQueued
	| history |
	history := self socketsQueuedHistory.
	history addValue: history last + 1