historys
clientSideCommitTimeHistory
	"The time this client spends serializing commit-packages, excluding the time spent waiting for a response (for that, see timeToSubmitHistoryFor: MaWriteRequest) and also excludes the time to refresh the client view, which happens for commits, aborts or begins and is captured in my #refreshViewHistory."
	^clientSideCommitTimeHistory