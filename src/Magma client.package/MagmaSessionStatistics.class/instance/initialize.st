initialize-release
initialize
	super initialize.
	clientSideConnectionTimeHistory := MaStatHistory name: 'Connection Time (client-side work only)'.
	refreshAllTimeHistory := MaStatHistory name: 'Refresh All Time (part of connection process)'.
	clientSideMcPageReadsTimeHistory := MaStatHistory name: 'MagmaCollection Page Reads (client-side work)'.
	clientSideProxyMaterializationTimeHistory := MaStatHistory name: 'Proxy Materializations (client-side work only)'.
	clientSideCommitTimeHistory := MaStatHistory name: 'Time to Serialize Commit Packages (client-side work only)'.
	objectsReadPerSecond := MaStatHistory name: 'The speed of read-service provided to this client, in objects per second.'.
	objectBytesReadPerSecond := MaStatHistory name: 'The speed of read requests in terms of bytes per second read off the server disk by this client only.'.
	refreshViewHistory := MaStatHistory name: 'Time to Refresh View'.
	startTime := DateAndTime now