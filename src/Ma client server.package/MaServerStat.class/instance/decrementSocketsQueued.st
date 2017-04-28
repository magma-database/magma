recording
decrementSocketsQueued
	| stat |
	stat := self socketsQueuedStat.
	stat last: stat last - 1