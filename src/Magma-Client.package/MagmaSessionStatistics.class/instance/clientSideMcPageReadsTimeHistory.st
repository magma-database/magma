historys
clientSideMcPageReadsTimeHistory
	"The time loading pages of objects due to paging through a MagmaCollectionReader or enumerating an entire MagmaCollection.  This includes only the client-side materialization time, not the time waiting for the server to return the buffers.  For that, add in the time from my #timeToSubmitHistoryFor: MaRefreshSegmentRequest for reader pages or MaSegmentByIndexRequest for enumerating an entire collection."
	^clientSideMcPageReadsTimeHistory